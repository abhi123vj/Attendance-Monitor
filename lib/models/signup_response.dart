import 'dart:convert';

SignUpResponse signUpResponseFromJson(Map<String,dynamic> str) => SignUpResponse.fromJson(str);

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
    SignUpResponse({
        required this.success,
        this.message,
        this.user,
    });

    bool success;
    String ?message;
    User ?user;

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "user": user == null ? null : user!.toJson(),
    };
}

class User {
    User({
        required this.name,
        required this.username,
        required this.mobnumber,
        required this.dept,
        required this.role,
        required this.currentuserStatus,
    });

    String name;
    String username;
    int mobnumber;
    String dept;
    String role;
    String currentuserStatus;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        role: json["role"] == null ? null : json["role"],
        currentuserStatus: json["currentuserStatus"] == null ? null : json["currentuserStatus"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "mobnumber": mobnumber == null ? null : mobnumber,
        "dept": dept == null ? null : dept,
        "role": role == null ? null : role,
        "currentuserStatus": currentuserStatus == null ? null : currentuserStatus,
    };
}