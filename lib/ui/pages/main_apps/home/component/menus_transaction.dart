import 'package:money_qu/utils/my_import.dart';

class MenusTransactionPage extends StatelessWidget {
  final String iconUrl, title, amount, dateTime;

  const MenusTransactionPage({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.amount,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18).r,
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48.w,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: Font.poppinsMedium,
                    fontSize: 16.sp,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  dateTime,
                  style: TextStyle(
                      fontFamily: Font.poppins,
                      fontSize: 12.sp,
                      color: MyColors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: Font.poppinsMedium,
              fontSize: 16.sp,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
