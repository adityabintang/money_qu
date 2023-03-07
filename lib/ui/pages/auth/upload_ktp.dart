import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_qu/models/sign_up_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_event.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import '../../../utils/my_import.dart';
import '../../widget/buttons_widget.dart';

class UploadKtpPage extends StatefulWidget {
  final SignUpModel data;

  const UploadKtpPage({Key? key, required this.data}) : super(key: key);

  @override
  State<UploadKtpPage> createState() => _UploadKtpPageState();
}

class _UploadKtpPageState extends State<UploadKtpPage> {
  TextEditingController pinController = TextEditingController();

  void successPage() {
    context.read<AuthBloc>().add(
      AuthRegister(widget.data),
    );
  }

  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return _buildBody();
        },
        listener: (context, state) {
          if (state is AuthFailure) {
            showCustomSnackBar(context, state.error);
          }
          if (state is AuthSuccess) {
            goAll(const HomePage(), context);
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      children: [
        Container(
          width: 155.w,
          height: 50.h,
          margin: const EdgeInsets.only(top: 100, bottom: 100).r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.img.imgLogoLight.path,
              ),
            ),
          ),
        ),
        Text(
          'Verify Your\nAccount',
          style: TextStyle(
            fontWeight: semiBold,
            fontFamily: Font.poppinsSemiBold,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: const EdgeInsets.all(22).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r, color: MyColors.white),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final image = await pickImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.lightBackground,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              Assets.icon.icUpload.path,
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text(
                  'Passport/ID Card',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: medium,
                    fontFamily: Font.poppinsMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),

              ///Button Sign In
              CustomButtonWidget(
                textButton: 'Continue',
                onPressed: () {
                  if (validate()) {
                    context.read<AuthBloc>().add(
                      AuthRegister(
                        widget.data.copyWith(
                          ktp: 'data:image/png;base64,' +
                              base64Encode(File(selectedImage!.path)
                                  .readAsBytesSync()),
                        ),
                      ),
                    );
                  } else {
                    showCustomSnackBar(context, 'Gambar tidak boleh kosong');
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60.h,
        ),

        ///Create New Account
        CustomTextButtonWidget(
          textButton: 'Skip for Now',
          onPressed: successPage,
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
