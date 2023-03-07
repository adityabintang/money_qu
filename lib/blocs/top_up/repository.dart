import 'dart:convert';

import 'package:money_qu/models/top_up_model.dart';
import 'package:money_qu/services/auth.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart' as http;

class TopUpRepository {
  Future<String> fetchTopUp(TopUpModel data) async {
    try {
      final token = await auth.getToken();

      var _url = BASE_URL + "/top_ups";
      print('[paymentBloc] fetchTopUp, POST: $_url');

      var client = http.Client();
      final res = await client.post(
        Uri.parse(_url),
        body: data.toJson(),
        headers: {
          "Authorization": "Bearer" + token,
        },
      );
      client.close();
      print(data.toJson());
      if (res.statusCode == 200) {
        print(res.body);
        return json.decode(res.body)['redirect_url'];
      }else{
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
