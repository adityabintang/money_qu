import 'package:money_qu/utils/my_import.dart';

class RecentUserWidget extends StatelessWidget {
  final String imgUrl, name, userName;
  final bool isVerified;

  const RecentUserWidget({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.userName,
     this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22).r,
      margin: const EdgeInsets.only(bottom: 18).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: MyColors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            margin: EdgeInsets.only(right: 14).r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imgUrl,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: Font.poppinsMedium,
                  fontSize: 16.sp,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '@$userName',
                style: TextStyle(
                  color: MyColors.grey,
                  fontFamily: Font.poppins,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: isVerified ? true: false,
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 14,
                  color: MyColors.green,
                ),
                Text(
                  'Verified',
                  style: TextStyle(
                      color: MyColors.green,
                      fontFamily: Font.poppinsMedium,
                      fontSize: 11.sp,
                      fontWeight: medium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
