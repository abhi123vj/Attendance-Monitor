// To parse this JSON data, do
//
//     final agreement = agreementFromJson(jsonString);

import 'dart:convert';

Agreement agreementFromJson(String str) => Agreement.fromJson(json.decode(str));

String agreementToJson(Agreement data) => json.encode(data.toJson());

class Agreement {
    Agreement({
       required this.success,
       required this.timetable,
    });

    bool success;
    Timetable timetable;

    factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
        success: json["success"],
        timetable: Timetable.fromJson(json["timetable"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "timetable": timetable.toJson(),
    };
}

class Timetable {
    Timetable({
       required this.thursday,
       required this.wednesday,
       required this.tuesday,
    });

    List<Sday> thursday;
    List<Sday> wednesday;
    List<Sday> tuesday;

    factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        thursday: List<Sday>.from(json["Thursday"].map((x) => Sday.fromJson(x))),
        wednesday: List<Sday>.from(json["Wednesday"].map((x) => Sday.fromJson(x))),
        tuesday: List<Sday>.from(json["Tuesday"].map((x) => Sday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Thursday": List<dynamic>.from(thursday.map((x) => x.toJson())),
        "Wednesday": List<dynamic>.from(wednesday.map((x) => x.toJson())),
        "Tuesday": List<dynamic>.from(tuesday.map((x) => x.toJson())),
    };
}

class Sday {
    Sday({
       required this.startTime,
        required this.endTime,
       required this.subjectName,
    });

    String startTime;
    String endTime;
    String subjectName;

    factory Sday.fromJson(Map<String, dynamic> json) => Sday(
        startTime: json["startTime"],
        endTime: json["endTime"],
        subjectName: json["subjectName"],
    );

    Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "subjectName": subjectName,
    };
}
