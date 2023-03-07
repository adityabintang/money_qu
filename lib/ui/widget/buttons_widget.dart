import '../../utils/my_import.dart';

class CustomButtonWidget extends StatelessWidget {
  final String textButton, fontFamily;
  final double height, width, fontSize;
  final Color color, textColor;
  final double radius;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;

  const CustomButtonWidget({
    Key? key,
    required this.textButton,
    this.fontFamily = Font.poppinsSemiBold,
    this.height = 50,
    this.width = double.infinity,
    this.color = MyColors.purple,
    this.radius = 56,
    this.fontSize = 16,
    this.textColor = MyColors.white,
    required this.onPressed,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius).w),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: fontWeight ?? semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextButtonWidget extends StatelessWidget {
  final String textButton, fontFamily;
  final double height, width, fontSize;
  final Color color, textColor;
  final double radius;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry padding;

  const CustomTextButtonWidget({
    Key? key,
    required this.textButton,
    this.fontFamily = Font.poppins,
    this.height = 24,
    this.width = double.infinity,
    this.color = MyColors.grey,
    this.radius = 56,
    this.fontSize = 16,
    this.textColor = MyColors.grey,
    this.padding = EdgeInsets.zero,
    required this.onPressed,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: MaterialButton(
        padding: padding,
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
