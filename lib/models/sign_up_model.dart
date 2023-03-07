// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel? signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel? data) => json.encode(data!.toJson());

class SignUpModel {
  SignUpModel({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.ktp,
    this.pin,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
    String? profilePicture,
    String? ktp,
    String? pin,
  }) =>
      SignUpModel(

        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
        pin: pin ?? this.pin,
      );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        profilePicture: json["profile_picture"],
        ktp: json["ktp"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "profile_picture": profilePicture,
        "ktp": ktp,
        "pin": pin,
      };
}
