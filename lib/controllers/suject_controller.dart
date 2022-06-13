import 'dart:convert';
import 'dart:developer';

import 'package:attendance_montior/models/syllabus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/subject.dart';

class SubjectController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxString semValue = "".obs;
  final TextEditingController semTextEditingController =
      TextEditingController();
  final TextEditingController subTextEditingController =
      TextEditingController();
  RxList semList = <String>[].obs;
  Map<String, SubjectResponse> subjectsMap = {}.obs.cast();
  Map keyFinder = {};
  Rx<SyllabusResponse> syllabus = SyllabusResponse(
          credits: "credits",
          module1: "module1",
          module2: "module2",
          module3: "module3",
          module4: "module4")
      .obs;
  RxBool isSyllabusEmplty = true.obs;
  void onInit() {
    semTextEditingController.addListener(() {
      isSyllabusEmplty.value = true;
      semValue.value = semTextEditingController.text;
      fetchSubject(semValue.value);
    });
    subTextEditingController.addListener(() {
      //semValue.value = subTextEditingController.text;
      isSyllabusEmplty.value = true;
      fetchSyllabus(keyFinder[subTextEditingController.text]);
    });
    fetchsem();
    super.onInit();
  }

  fetchSyllabus(id) {
    try {
      final docRef = db.collection("Syllabus").doc("2018 Scheme");
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              if (key.trim() == id.toString().trim()) {
                isSyllabusEmplty.value = false;
                syllabus.value = SyllabusResponse.fromJson(value);
                log(value["Module1"].toString());
              }
            },
          );
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      log("err $e");
    }
  }

  fetchSubject(sem) async {
    subjectsMap.clear();
    keyFinder.clear();
    final docRef = db.collection("Subjects").doc(sem);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        data.forEach(
          (key, value) {
            subjectsMap[key] = SubjectResponse.fromJson(value);
            keyFinder[SubjectResponse.fromJson(value).subjectName] = key;
          },
        );
        log("message ${subjectsMap}");
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
