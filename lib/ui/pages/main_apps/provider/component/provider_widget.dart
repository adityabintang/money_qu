import 'package:money_qu/utils/my_import.dart';

class DataProviderItemWidget extends StatelessWidget {
  final String imgUrl, nameProvider;
  final bool isAvailable, isSelected;

  const DataProviderItemWidget({
    Key? key,
    required this.imgUrl,
    required this.nameProvider,
    this.isAvailable = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22).r,
      margin: const EdgeInsets.only(bottom: 18).r,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(
          color: isSelected ? MyColors.blue : MyColors.white,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgUrl,
            height: 30.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                nameProvider,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: Font.poppinsMedium,
                ),
              ),
              isAvailable
                  ? Text(
                      'Available',
                      style: TextStyle(
                        color: MyColors.grey,
                        fontSize: 12.sp,
                        fontFamily: Font.poppins,
                      ),
                    )
                  : Text(
                      'Unavailable',
                      style: TextStyle(
                        color: MyColors.grey,
                        fontSize: 12.sp,
                        fontFamily: Font.poppins,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
