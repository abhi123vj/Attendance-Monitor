// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(Map<String, dynamic> str) =>
    LoginResponse.fromJson(str);


class LoginResponse {
  LoginResponse({
    required this.success,
    this.user,
     this.token,
  });

  bool success;
  User? user;
  String? token;
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"] == null ? null : json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
         token: json["token"] == null ? null :json["token"],
      );

 
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobnumber,
    required this.dept,
    required this.currentuserStatus,
  });

  String id;
  String name;
  String email;
  int mobnumber;
  String dept;
  String currentuserStatus;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        currentuserStatus: json["currentuserStatus"] == null
            ? null
            : json["currentuserStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "mobnumber": mobnumber == null ? null : mobnumber,
        "dept": dept == null ? null : dept,
        "currentuserStatus":
            currentuserStatus == null ? null : currentuserStatus,
      };
}
