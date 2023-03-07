import 'package:money_qu/utils/my_import.dart';

class BankItemWidget extends StatelessWidget {
  final String? imgUrl, title;
  final bool isSelected;

  const BankItemWidget({
    Key? key,
    required this.imgUrl,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18).r,
      padding: EdgeInsets.all(22).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: isSelected ? Colors.green.shade100 : MyColors.white,
        border: Border.all(
          width: 2.w,
          color: isSelected ? Colors.green.shade100 : MyColors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imgUrl != null
              ? Image.network(
                  imgUrl ?? '',
                  height: 30.h,
                )
              : Image.asset(
                  imgUrl ?? Assets.img.imgBankMandiri.path,
                  height: 30.h,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: Font.poppinsMedium,
                    fontWeight: medium),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '50 mins',
                style: TextStyle(
                  color: MyColors.grey,
                  fontFamily: Font.poppins,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
