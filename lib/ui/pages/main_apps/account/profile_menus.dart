import '../../../../utils/my_import.dart';

class ProfileMenusItem extends StatelessWidget {
  final String iconUrl, title;
  final VoidCallback? onTap;

  const ProfileMenusItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(iconUrl, width: 24.w),
            SizedBox(
              width: 18.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: Font.poppinsMedium,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
