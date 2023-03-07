import '../../utils/my_import.dart';

class InputNumberButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const InputNumberButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: MyColors.blackButton,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: semiBold,
              fontFamily: Font.poppinsSemiBold,
              color: MyColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
