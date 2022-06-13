// To parse this JSON data, do
//
//     final subjectResponse = subjectResponseFromJson(jsonString);

import 'dart:convert';

Map<String, SubjectResponse> subjectResponseFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, SubjectResponse>(k, SubjectResponse.fromJson(v)));

String subjectResponseToJson(Map<String, SubjectResponse> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class SubjectResponse {
    SubjectResponse({
        required this.branch,
        required this.subjectName,
    });

    List<String> branch;
    String subjectName;

    factory SubjectResponse.fromJson(Map<String, dynamic> json) => SubjectResponse(
        branch: List<String>.from(json["branch"].map((x) => x)),
        subjectName: json["subjectName"],
    );

    Map<String, dynamic> toJson() => {
        "branch": List<dynamic>.from(branch.map((x) => x)),
        "subjectName": subjectName,
    };
}