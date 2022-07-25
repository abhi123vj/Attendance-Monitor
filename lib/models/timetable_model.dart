// To parse this JSON data, do
//
//     final timeTable = timeTableFromJson(jsonString);

import 'dart:convert';

TimeTable timeTableFromJson(Map<String, dynamic> str) =>
    TimeTable.fromJson(str);

class TimeTable {
  TimeTable({
    required this.success,
    this.timetable,
  });

  bool success;
  Timetable? timetable;

  factory TimeTable.fromJson(Map<String, dynamic> json) => TimeTable(
        success: json["success"] == null ? null : json["success"],
        timetable: json["timetable"] == null
            ? null
            : Timetable.fromJson(json["timetable"]),
      );
}

class Timetable {
  Timetable({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
  });

  List<Sday>? monday;
  List<Sday>? tuesday;
  List<Sday>? wednesday;
  List<Sday>? thursday;
  List<Sday>? friday;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        monday: json["Monday"] == null
            ? null
            : List<Sday>.from(json["Monday"].map((x) => Sday.fromJson(x))),
        tuesday: json["Tuesday"] == null
            ? null
            : List<Sday>.from(json["Tuesday"].map((x) => Sday.fromJson(x))),
        wednesday: json["Wednesday"] == null
            ? null
            : List<Sday>.from(json["Wednesday"].map((x) => Sday.fromJson(x))),
        thursday: json["Thursday"] == null
            ? null
            : List<Sday>.from(json["Thursday"].map((x) => Sday.fromJson(x))),
        friday: json["Friday"] == null
            ? null
            : List<Sday>.from(json["Friday"].map((x) => Sday.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "Thursday": thursday == null
            ? null
            : List<dynamic>.from(thursday!.map((x) => x.toJson())),
        "Wednesday": wednesday == null
            ? null
            : List<dynamic>.from(wednesday!.map((x) => x.toJson())),
        "Monday": monday == null
            ? null
            : List<dynamic>.from(monday!.map((x) => x.toJson())),
        "friday": monday == null
            ? null
            : List<dynamic>.from(friday!.map((x) => x.toJson())),
        "Tuesday": tuesday == null
            ? null
            : List<dynamic>.from(tuesday!.map((x) => x.toJson())),
      };
}

class Sday {
  Sday({
    required this.startTime,
    required this.endTime,
    required this.semester,
    required this.branch,
    required this.subjectName,
  });

  String startTime;
  String endTime;
  String semester;
  String branch;
  String subjectName;

  factory Sday.fromJson(Map<String, dynamic> json) => Sday(
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        semester: json["semester"] == null ? null : json["semester"],
        branch: json["branch"] == null ? null : json["branch"],
        subjectName: json["subjectName"] == null ? null : json["subjectName"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "semester": semester == null ? null : semester,
        "branch": branch == null ? null : branch,
        "subjectName": subjectName == null ? null : subjectName,
      };
}
