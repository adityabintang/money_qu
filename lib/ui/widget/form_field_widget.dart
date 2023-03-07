// ignore_for_file: prefer_const_constructors

import '../../utils/my_import.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final bool obsecureText;
  final String textField, fontFamily, hintText;
  final FontWeight? fontWeight;
  final double fontSize;
  final EdgeInsetsGeometry? contenPadding;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  const CustomFormFieldWidget({
    Key? key,
    this.obsecureText = false,
    required this.textField,
    this.fontFamily = Font.poppinsMedium,
    this.fontWeight,
    this.fontSize = 14,
    this.contenPadding,
    this.borderRadius,
    this.controller,
    this.keyboardType,
    this.hintText = "",
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textField,
          style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: fontWeight ?? medium,
            fontSize: fontSize.sp,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obsecureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: MyColors.grey,
              fontSize: 14.sp,
              fontFamily: Font.poppins,
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(14).r,
            ),
            contentPadding: contenPadding ?? EdgeInsets.all(12).r,
          ),
        )
      ],
    );
  }
}
