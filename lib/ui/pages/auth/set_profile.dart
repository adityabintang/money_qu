import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:money_qu/models/sign_up_model.dart';
import 'package:money_qu/ui/pages/auth/upload_ktp.dart';
import '../../../utils/my_import.dart';
import '../../widget/buttons_widget.dart';
import '../../widget/form_field_widget.dart';

class SetProfilePage extends StatefulWidget {
  final SignUpModel data;

  const SetProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  State<SetProfilePage> createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  TextEditingController pinController = TextEditingController();
  bool obsecureText = true;

  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
            'Join Us to Unlock\nYour Growth',
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
              borderRadius: BorderRadius.circular(20).r,
              color: MyColors.white,
            ),
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
                // Container(
                //   width: 120.w,
                //   height: 120.h,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage(Assets.img.imgProfile.path),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '${widget.data.name}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: medium,
                    fontFamily: Font.poppinsMedium,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),

                ///Field Password
                CustomFormFieldWidget(
                  textField: 'Set PIN ( 6 digit Number )',
                  controller: pinController,
                  obsecureText: obsecureText,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30.h,
                ),

                ///Button Sign In
                CustomButtonWidget(
                  textButton: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      goTo(
                        UploadKtpPage(
                          data: widget.data.copyWith(
                            pin: pinController.text,
                            profilePicture: selectedImage == null
                                ? null
                                : 'data:image/png;base64,' +
                                    base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    ),
                          ),
                        ),
                        context,
                      );
                    } else {
                      showCustomSnackBar(context,
                          'PIN harus memiliki kombinasi 6 digit angka');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
