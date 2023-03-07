import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/models/edit_profile_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/index.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_edit_success.dart';
import '../../../../utils/my_import.dart';
import '../../../widget/buttons_widget.dart';
import '../../../widget/form_field_widget.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  bool obsecureText = true;

  @override
  void initState() {
    super.initState();
    final authstate = context.read<AuthBloc>().state;

    if (authstate is AuthSuccess) {
      emailController.text = authstate.user.email!;
      passwdController.text = authstate.user.password!;
      fullNameController.text = authstate.user.name!;
      userNameController.text = authstate.user.username!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            goBack(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: const Text(
          'Edit Profile',
        ),
      ),
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
            goAll(const ProfileEditSuccess(), context);
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: const EdgeInsets.all(22).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r, color: MyColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormFieldWidget(
                textField: 'Username',
                controller: userNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormFieldWidget(
                textField: 'Full Name',
                controller: fullNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormFieldWidget(
                textField: 'Email Address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormFieldWidget(
                textField: 'Password',
                obsecureText: obsecureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obsecureText = !obsecureText;
                    });
                  },
                  child: obsecureText
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
                controller: passwdController,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButtonWidget(
                textButton: 'Update Now',
                onPressed: () async {
                  context.read<AuthBloc>().add(
                        UpdateUser(
                          EditProfileModel(
                              email: emailController.text,
                              username: userNameController.text,
                              password: passwdController.text,
                              name: fullNameController.text),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
