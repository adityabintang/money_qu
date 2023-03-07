import 'package:intl/intl.dart';
import 'package:money_qu/ui/pages/main_apps/pin/pin_page.dart';
import 'package:money_qu/ui/pages/main_apps/transfer/transfer_success.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/ui/widget/input_number_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({Key? key}) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  addAmount(String? number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number!;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    amountController.addListener(
      () {
        final text = amountController.text;

        amountController.value = amountController.value.copyWith(
          text: NumberFormat.currency(
            locale: 'id',
            decimalDigits: 0,
            symbol: '',
          ).format(
            int.parse(text.replaceAll('.', '')),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBackground,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: TextStyle(
                color: MyColors.white,
                fontSize: 20.sp,
                fontWeight: semiBold,
                fontFamily: Font.poppinsSemiBold,
              ),
            ),
          ),
          SizedBox(
            height: 67.h,
          ),
          Align(
            child: SizedBox(
              width: 200.w,
              child: TextFormField(
                keyboardType: TextInputType.none,
                enabled: false,
                controller: amountController,
                cursorColor: MyColors.grey,
                style: TextStyle(
                  fontFamily: Font.poppinsMedium,
                  fontWeight: medium,
                  color: MyColors.white,
                  fontSize: 36.sp,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: TextStyle(
                      fontFamily: Font.poppinsMedium,
                      fontWeight: medium,
                      color: MyColors.white,
                      fontSize: 36.sp,
                    ),
                  ),
                  disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 66.h,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              InputNumberButton(
                onTap: () {
                  addAmount('1');
                },
                title: '1',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('2');
                },
                title: '2',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('3');
                },
                title: '3',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('4');
                },
                title: '4',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('5');
                },
                title: '5',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('6');
                },
                title: '6',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('7');
                },
                title: '7',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('8');
                },
                title: '8',
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('9');
                },
                title: '9',
              ),
              SizedBox(
                height: 60.h,
                width: 60.w,
              ),
              InputNumberButton(
                onTap: () {
                  addAmount('0');
                },
                title: '0',
              ),
              GestureDetector(
                onTap: deleteAmount,
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.blackButton,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: MyColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomButtonWidget(
            textButton: 'Continue',
            onPressed: () async {
              if (await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PinPages(),
                    ),
                  ) ==
                  true) {
                await launch('https://demo.midtrans.com/');
                goAll(const TransferSuccessPage(), context);
              }
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextButtonWidget(
            textButton: 'Terms & Conditions',
            onPressed: () {},
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
