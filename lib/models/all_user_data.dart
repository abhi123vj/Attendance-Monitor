// To parse this JSON data, do
//
//     final newSyllabusModel = newSyllabusModelFromJson(jsonString);

import 'dart:convert';

AllUserData allUserDataFromJson(Map<String,dynamic> str) => AllUserData.fromJson(str);


class AllUserData {
    AllUserData({
        required this.success,
        this.users,
        this.students,
    });

    bool success;
    List<User>? users;
    List<Student>? students;

    factory AllUserData.fromJson(Map<String, dynamic> json) => AllUserData(
        success: json["success"] == null ? null : json["success"],
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
        students: json["students"] == null ? null : List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    );

 
}

class Student {
    Student({
        this.id,
        this.name,
        this.email,
        this.mobnumber,
        this.dept,
        this.batch,
        this.registernumber,
        this.studentId,
        this.currentuserStatus,

    });

    String ?id;
    String? name;
    String ?email;
    int? mobnumber;
    String? dept;
    String ?batch;
    int? registernumber;
    String ?studentId;
    String ?currentuserStatus;
 

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        batch: json["batch"] == null ? null : json["batch"],
        registernumber: json["registernumber"] == null ? null : json["registernumber"],
        studentId: json["studentId"] == null ? null : json["studentId"],
        currentuserStatus: json["currentuserStatus"] == null ? null : json["currentuserStatus"],
    
    );

}

class User {
    User({
        this.id,
        this.name,
        this.mobnumber,
        this.dept,
        this.role,
        this.currentuserStatus,
    
        this.email,
    });

    String ?id;
    String? name;
    int ?mobnumber;
    String ?dept;
    String ?role;
    String ?currentuserStatus;
    String? email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        mobnumber: json["mobnumber"] == null ? null : json["mobnumber"],
        dept: json["dept"] == null ? null : json["dept"],
        role: json["role"] == null ? null : json["role"],
        currentuserStatus: json["currentuserStatus"] == null ? null : json["currentuserStatus"],
     
        email: json["email"] == null ? null : json["email"],
      
    );
    
}
