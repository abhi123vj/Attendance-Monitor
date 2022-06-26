import 'dart:convert';
import 'dart:developer';

import 'package:attendance_montior/models/newSyllabus.dart';
import 'package:attendance_montior/models/syllabus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SubjectController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxString semValue = "".obs;
  final TextEditingController semTextEditingController =
      TextEditingController();
  final TextEditingController subTextEditingController =
      TextEditingController();
  RxList semList = <String>[].obs;
  Rx<NewSyllabusModel> syllabus = NewSyllabusModel().obs;
  RxMap subjectsMap = {}.obs;
  RxInt activeSubjectIndex = 1.obs;
  @override
  void onInit() {
    semTextEditingController.addListener(() {
      semValue.value = semTextEditingController.text;
      syllabus.value = NewSyllabusModel();
      subTextEditingController.clear();
      fetchSubject(semValue.value);
    });
    subTextEditingController.addListener(() async {
      //semValue.value = subTextEditingController.text;
      for (var key in subjectsMap.keys) {
        if (subjectsMap[key] == subTextEditingController.text) {
          fetchSyllabus2(key);
          break;
        }
      }
    });
    fetchsem();
    super.onInit();
  }

  fetchSyllabus2(id) async {
    try {
      await db.collection("Syllabus").doc(id).get().then(
        (DocumentSnapshot doc) {
          if(doc.data()!=null){
            final data = doc.data() as Map<String, dynamic>;
          var jsonDecod = NewSyllabusModel.fromJson(data);
          log("jsonDecod = ${jsonDecod.references}");
          syllabus.value = jsonDecod;}
          // syllabus.value= SyllabusResponse.fromJson(data[id]);
        },
        onError: (e) {
          print("Error getting document: $e");
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  fetchSubject(sem) async {
    final docRef = db.collection("Subjects/").doc(sem);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        subjectsMap.clear();
        data.forEach(
          (key, value) {
            log("message ${key} value = ${value['subjectName']}");
            subjectsMap[key] = value['subjectName'];
          },
        );
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  fetchsem() async {
    try {
      await db.collection("Subjects").get().then((event) {
        for (var doc in event.docs) {
          semList.add(doc.id);

          print("${doc.id} => ${doc.data()}");
        }
      });
    } catch (e) {
      log("Sems error $e");
    }
    log("SThe sem $semList");
  }
}
