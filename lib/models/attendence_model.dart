// To parse this JSON data, do
//
//     final attendenceResponseModel = attendenceResponseModelFromJson(jsonString);

import 'dart:convert';

AttendenceResponseModel attendenceResponseModelFromJson(Map<String, dynamic> str) => AttendenceResponseModel.fromJson(str);


class AttendenceResponseModel {
    AttendenceResponseModel({
       required this.success,
        this.attendance,
    });

    bool success;
    Attendance? attendance;

    factory AttendenceResponseModel.fromJson(Map<String, dynamic> json) => AttendenceResponseModel(
        success: json["success"] == null ? null : json["success"],
        attendance: json["attendance"] == null ? null : Attendance.fromJson(json["attendance"]),
    );


}

class Attendance {
    Attendance({
       required this.dates,
       required this.studentAttendance,
    });

    List<Date> dates;
    List<StudentAttendance> studentAttendance;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        dates: json["dates"] == null ? [] : List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        studentAttendance: json["studentAttendance"] == null ? [] : List<StudentAttendance>.from(json["studentAttendance"].map((x) => StudentAttendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dates": dates == null ? null : List<dynamic>.from(dates.map((x) => x.toJson())),
        "studentAttendance": studentAttendance == null ? null : List<dynamic>.from(studentAttendance.map((x) => x.toJson())),
    };
}

class Date {
    Date({
      required  this.date,
       required this.period,
         required      this.notes,

      required  this.id,
    });

    String period;

    DateTime date;
    String notes;
    String id;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        date:  DateTime.parse(json["date"]),
        period: json["period"] == null ? null : json["period"],
         notes: json["notes"] == null ? null : json["notes"],
        id: json["_id"] == null ? null : json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "period": period == null ? null : period,
        "_id": id == null ? null : id,
    };
}

class StudentAttendance {
    StudentAttendance({
       required this.name,
       required this.registernumber,
       required this.attendance,
    });

    String name;
    int registernumber;
    String attendance;

    factory StudentAttendance.fromJson(Map<String, dynamic> json) => StudentAttendance(
        name: json["name"] == null ? null : json["name"],
        registernumber: json["registernumber"] == null ? null : json["registernumber"],
        attendance: json["attendance"] == null ? null : json["attendance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "registernumber": registernumber == null ? null : registernumber,
        "attendance": attendance == null ? null : attendance,
    };
}
