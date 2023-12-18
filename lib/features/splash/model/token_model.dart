import 'dart:convert';

import 'package:bloc_app/core/models/base_model.dart';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel extends IBaseModel {
  final String? token;
  final String? refreshToken;
  final String? username;

  TokenModel({
    required this.token,
    required this.refreshToken,
    required this.username,
  });

  @override
  factory TokenModel.fromJson(Map<dynamic, dynamic> json) => TokenModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "username": username,
      };

  @override
  fromJsonMap(Map json) {
    throw UnimplementedError();
  }

  @override
  fromString(Map jsonData) {
    return TokenModel.fromJson(jsonData);
  }

  @override
  List fromJson(String jsonData) {
    return [];
  }
}
