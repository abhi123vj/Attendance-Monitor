// To parse this JSON data, do
//
//     final newSyllabusModel = newSyllabusModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

NewSyllabusModel newSyllabusModelFromJson(String str) => NewSyllabusModel.fromJson(json.decode(str));

class NewSyllabusModel {
    NewSyllabusModel({
        this.references,
        this.credits,
        this.branches,
        this.modules,
    });

    RxList<String>? references;
    String? credits;
    List<Branch>? branches;
    List<Module>? modules;

    factory NewSyllabusModel.fromJson(Map<String, dynamic> json) => NewSyllabusModel(
        references: json["references"] == null ? null : RxList<String>.from(json["references"].map((x) => x)),
        credits: json["credits"] == null ? null : json["credits"],
        branches: json["Branches"] == null ? null : List<Branch>.from(json["Branches"].map((x) => Branch.fromJson(x))),
        modules: json["modules"] == null ? null : List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
    );

    
}

class Branch {
    Branch({
        this.branchTeacher,
        this.branchName,
    });

    String? branchTeacher;
    String? branchName;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchTeacher: json["branchTeacher"] == null ? null : json["branchTeacher"],
        branchName: json["branchName"] == null ? null : json["branchName"],
    );

    Map<String, dynamic> toJson() => {
        "branchTeacher": branchTeacher == null ? null : branchTeacher,
        "branchName": branchName == null ? null : branchName,
    };
}

class Module {
    Module({
        this.moduleName,
        this.moduleData,
    });

    String? moduleName;
    List<String>? moduleData;

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        moduleName: json["moduleName"] == null ? null : json["moduleName"],
        moduleData: json["moduleData"] == null ? null : List<String>.from(json["moduleData"].map((x) => x)),
    );

   
}
