// To parse this JSON data, do
//
//     final studentListResponseModel = studentListResponseModelFromJson(jsonString);

import 'dart:convert';

StudentListResponseModel studentListResponseModelFromJson(Map<String, dynamic> str) =>
    StudentListResponseModel.fromJson(str);

String studentListResponseModelToJson(StudentListResponseModel data) =>
    json.encode(data.toJson());

class StudentListResponseModel {
  StudentListResponseModel({
    required this.success,
    required this.studentsList,
  });

  bool success;
  List<StudentsList> studentsList;

  factory StudentListResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentListResponseModel(
        success: json["success"] == null ? null : json["success"],
        studentsList: json["studentsList"] == null
            ? []
            : List<StudentsList>.from(
                json["studentsList"].map((x) => StudentsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "studentsList": studentsList == null
            ? null
            : List<dynamic>.from(studentsList.map((x) => x.toJson())),
      };
}

class StudentsList {
  StudentsList(
      {required this.id,
      required this.name,
      required this.registernumber,
      this.status});

  String id;
  String name;
  int registernumber;
  bool? status;
  factory StudentsList.fromJson(Map<String, dynamic> json) => StudentsList(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        registernumber:
            json["registernumber"] == null ? null : json["registernumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "registernumber": registernumber == null ? null : registernumber,
      };
}
