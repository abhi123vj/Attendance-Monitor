// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);


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
    required this.subjects,
  });

  String id;
  String name;
  String email;
  int mobnumber;
  String dept;
  String currentuserStatus;
  List<Subject> subjects;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        currentuserStatus: json["currentuserStatus"] == null
            ? null
            : json["currentuserStatus"],
            subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "mobnumber": mobnumber == null ? null : mobnumber,
        "dept": dept == null ? null : dept,
        "currentuserStatus":
            currentuserStatus == null ? null : currentuserStatus,
             "subjects": subjects == null ? null : List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}


class Subject {
    Subject({
       required this.subjectName,
       required this.subjectId,
    });

    String subjectName;
    String subjectId;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subjectName: json["subjectName"] == null ? null : json["subjectName"],
        subjectId: json["subjectId"] == null ? null : json["subjectId"],
    );

    Map<String, dynamic> toJson() => {
        "subjectName": subjectName == null ? null : subjectName,
        "subjectId": subjectId == null ? null : subjectId,
    };
}
