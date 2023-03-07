import 'package:money_qu/utils/my_import.dart';

class MenusPage extends StatelessWidget {
  final String iconUrl, title;
  final VoidCallback? onTap;

  const MenusPage({
    Key? key,
    required this.title,
    required this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            margin: const EdgeInsets.only(bottom: 8).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: MyColors.white,
            ),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 26.w,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: Font.poppinsMedium,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
    );
  }
}
