// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// {
//     "identifier" : "rudi2@gmail.com",
//     "password" : "12345678"
// }

class LoginRequestModel {
  final String indentifier;
  final String password;

  LoginRequestModel({required this.indentifier, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'indentifier': indentifier,
      'password': password,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      indentifier: map['indentifier'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) => LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
