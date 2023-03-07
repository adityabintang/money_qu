import 'package:money_qu/utils/my_import.dart';

class MenuSendAgainPage extends StatelessWidget {
  final String imgUrl, username;

  const MenuSendAgainPage({
    Key? key,
    required this.imgUrl,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 17).r,
      width: 90.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: MyColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 13).r,
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          Text(
            '@$username',
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: Font.poppinsMedium,
            ),
          )
        ],
      ),
    );
  }
}
