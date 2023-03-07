import 'package:money_qu/utils/my_import.dart';

class ResultItemWidget extends StatelessWidget {
  final String imgUrl, name, userName;
  final bool isVerified, isSelected;

  const ResultItemWidget({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.userName,
    this.isVerified = false,
    this.isSelected = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 183.h,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22).r,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(
          color: isSelected ? MyColors.blue : MyColors.white,
          width: 2
        )
      ),
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imgUrl,
                ),
              ),
            ),
            child: Visibility(
              visible: isVerified ? true : false,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.white),
                  child: const Icon(
                    Icons.check_circle,
                    color: MyColors.green,
                    size: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
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
    );
  }
}
