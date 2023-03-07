import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/blocs/payment/bloc.dart';
import 'package:money_qu/blocs/payment/bloc_event.dart';
import 'package:money_qu/blocs/payment/bloc_state.dart';
import 'package:money_qu/models/payment_method_model.dart';
import 'package:money_qu/models/top_up_model.dart';
import 'package:money_qu/models/user_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/main_apps/top_up/top_up_amount.dart';
import 'package:money_qu/ui/widget/bank_widget.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/utils/my_import.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final PaymentMethodBloc paymentMethodBloc = PaymentMethodBloc();

  PaymentMethod? selectedPaymentMethod;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    paymentMethodBloc.add(PaymentMethodFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            goBack(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Wallet',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return cardNumber(state.user);
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Select Bank',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          _buildItemBank(),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: selectedPaymentMethod != null,
        child: Container(
          margin: const EdgeInsets.all(24).r,
          child: CustomButtonWidget(
            textButton: 'Continue',
            onPressed: () => goAmount(context),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildItemBank() {
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
      bloc: paymentMethodBloc,
      builder: (context, state) {
        if (state is PaymentMethodLoaded) {
          if (state.data.isEmpty) {
            return Container(
              child: const Center(
                child: Text('Tidak ada data yang ditemukan'),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = state.data[index];
                  });
                },
                child: BankItemWidget(
                  imgUrl: state.data[index].thumbnail ?? '-',
                  title: state.data[index].name,
                  isSelected: state.data[index].id == selectedPaymentMethod?.id,
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void goAmount(context) {
    goTo(
        TopUpAmountPage(
          data: TopUpModel(
            paymentMethodCode: selectedPaymentMethod?.code,
          ),
        ),
        context);
  }

  Widget cardNumber(UserModel data) {
    return Row(
      children: [
        Image.asset(
          Assets.img.imgBgWallet.path,
          width: 80.w,
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.cardNumber!.convertSpacing(),
              style: TextStyle(
                  fontFamily: Font.poppinsMedium,
                  fontSize: 16.sp,
                  fontWeight: medium),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              data.name.toString(),
              style: TextStyle(
                color: MyColors.grey,
                fontFamily: Font.poppins,
                fontSize: 12.sp,
              ),
            )
          ],
        )
      ],
    );
  }
}
