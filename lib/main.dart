import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stud_board/screen/admin_screens/admin_home.dart';
import 'package:stud_board/screen/student_screens/student_home.dart';
import 'package:stud_board/screen/splash.dart';
import 'package:stud_board/screen/teacher_screens/teacher_home.dart';

import 'api_services/api_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // final id = null;
  var person = await APIService().getOne("get-user");
  final id = await APIService().getPersonID();

  goTo() {
    if (person['role'] == "Student") {
      return StudentHome();
    } else if (person['role'] == "Teacher") {
      return const TeacherHome();
    } else if (person['role'] == "Admin") {
      return const AdminHome();
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (id?.isNotEmpty ?? false) ? goTo() : const SplashScreen(),
    ),
  );
}

//0xFF7b2a23
// Created Department , Program , Session , Semester, Subject, Student , Teacher screens
