import 'dart:convert';

import 'package:money_qu/models/payment_method_model.dart';
import 'package:money_qu/services/auth.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart' as http;

class PaymentMethodRepo{
  Future<List<PaymentMethod>> fetchPaymentMethod() async {
    try{
      final token = await auth.getToken();

      var _url = BASE_URL + "/payment_methods";

      print('[paymentBloc] fetchPaymentMethod, GET: $_url');

      var client = http.Client();
      final res = await client.get(
        Uri.parse(_url),
        headers: {
          "Authorization": "Bearer" + token,
        },
      );
      client.close();

      if (res.statusCode == 200) {
        final data = json.decode(res.body) as List;
        return data.map((rawpost) {
          return PaymentMethod.fromJson(rawpost);
        }).toList();
      }else{
        throw json.decode(res.body)['message'];
      }
    }catch(e){
      rethrow;
    }
  }
}