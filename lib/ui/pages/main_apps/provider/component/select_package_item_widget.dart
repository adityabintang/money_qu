import 'package:money_qu/utils/my_import.dart';

class SelectPackageItemWidget extends StatelessWidget {
  final bool isSelected;
  final int amount;
  final int price;
  const SelectPackageItemWidget({
    Key? key,
    this.isSelected = false,
    required this.amount,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 175.h,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22).r,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(
              color: isSelected ? MyColors.blue : MyColors.white, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount GB',
            style: TextStyle(
              fontFamily: Font.poppinsMedium,
              fontSize: 32.sp,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            formatCurrency(price),
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
