// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(Map<String,dynamic> str) => LoginResponse.fromJson(str);

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.success,
        this.user,
    });

    bool success;
    User ?user;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"] == null ? null : json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "user": user == null ? null : user?.toJson(),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.username,
        required this.mobnumber,
        required this.dept,
        required this.currentuserStatus,
    
    });

    String id;
    String name;
    String username;
    int mobnumber;
    String dept;
    String currentuserStatus;


    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        currentuserStatus: json["currentuserStatus"] == null ? null : json["currentuserStatus"],
      
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "mobnumber": mobnumber == null ? null : mobnumber,
        "dept": dept == null ? null : dept,
        "currentuserStatus": currentuserStatus == null ? null : currentuserStatus,     
    };
}
