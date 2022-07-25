// To parse this JSON data, do
//
//     final syllabus = syllabusFromJson(jsonString);

import 'dart:convert';

Syllabus syllabusFromJson(Map<String, dynamic> str) => Syllabus.fromJson(str);


class Syllabus {
    Syllabus({
      required  this.success,
        this.syllabus,
    });

    bool success;
    List<SyllabusElement>? syllabus;

    factory Syllabus.fromJson(Map<String, dynamic> json) => Syllabus(
        success: json["success"] == null ? null : json["success"],
        syllabus: json["syllabus"] == null ? null : List<SyllabusElement>.from(json["syllabus"].map((x) => SyllabusElement.fromJson(x))),
    );
}

class SyllabusElement {
    SyllabusElement({
      required  this.id,
      required  this.semester,
      required  this.dept,
      required  this.scheme,
      required  this.syllabus,
      
    });

    String id;
    String semester;
    String dept;
    String scheme;
    String syllabus;


    factory SyllabusElement.fromJson(Map<String, dynamic> json) => SyllabusElement(
        id: json["_id"] == null ? null : json["_id"],
        semester: json["semester"] == null ? null : json["semester"],
        dept: json["dept"] == null ? null :json["dept"],
        scheme: json["scheme"] == null ? null : json["scheme"],
        syllabus: json["syllabus"] == null ? null : json["syllabus"],
      
    );

  
}


