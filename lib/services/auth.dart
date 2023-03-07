import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:money_qu/models/edit_profile_model.dart';
import 'package:money_qu/utils/my_import.dart' as http;
import 'package:money_qu/models/sign_in_form_model.dart';
import 'package:money_qu/models/sign_up_model.dart';
import 'package:money_qu/models/user_model.dart';
import 'package:money_qu/utils/constants.dart';

class Auth {
  Future<bool> checkEmail(String email) async {
    try {
      var _url = BASE_URL + '/is-email-exist';

      print('[checkEmailBloc] checkEmail, POST: $_url');

      var client = http.Client();
      final res = await client.post(
        Uri.parse(_url),
        body: {
          'email': email,
        },
      );
      client.close();
      if (res.statusCode == 200) {
        print(res.body);
        return json.decode(res.body)['is_email_exist'];
      } else {
        throw json.decode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> postRegister(SignUpModel data) async {
    try {
      var _url = BASE_URL + '/register';
      print('[registerBloc] postRegister, POST: $_url');
      // var client = http.Client();
      final res = await http.post(
        Uri.parse(_url),
        body: data.toJson(),
      );
      // client.close();
      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.password = data.password;

        await storeCredentialUser(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      var _url = BASE_URL + '/login';
      print('[LoginBloc] login, POST: $_url');
      // var client = http.Client();
      final res = await http.post(
        Uri.parse(_url),
        body: data.toJson(),
      );
      // client.close();

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.password = data.password;

        await storeCredentialUser(user);
        print(res.body);
        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialUser(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialUser() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['token'] != null) {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        print('get user from local: ${data.toJson()}');

        return data;
      } else {
        throw 'unauthenticated';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    print(value);
    if (value != null) {
      token = value;
    }
    print(token);
    return token;
  }

  @override
  Future<void> clearCredential() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(EditProfileModel data) async {
    try {
      final token = await getToken();
      var _url = BASE_URL + '/users';

      print('[userBloc] updateUser, PUT: $_url');

      var client = http.Client();
      final res = await client.put(
        Uri.parse(_url),
        body: data.toJson(),
        headers: {
          "Authorization": "Bearer" + token,
        },
      );
      client.close();
      if (res.statusCode != 200) {
        print(res.body);
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePIN(String oldPin, String newPin) async {
    try {
      final token = await getToken();
      var _url = BASE_URL + '/wallets';

      print('[userBloc] updateUser, PUT: $_url');

      var client = http.Client();
      final res = await client.put(
        Uri.parse(_url),
        body: {'previous_pin': oldPin, 'new_pin': newPin},
        headers: {
          "Authorization": "Bearer" + token,
        },
      );
      client.close();
      if (res.statusCode != 200) {
        print(res.body);
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      final token = await getToken();
      var _url = BASE_URL + '/logout';
      print('[logOut] logOut, POST: $_url');

      var client = http.Client();
      final res = await client.post(
        Uri.parse(_url),
        headers: {
          "Authorization": "Bearer" + token,
        },
      );
      client.close();
      if (res.statusCode == 200) {
        print(res.body);
        await clearCredential();
      } else {
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}

final auth = Auth();
