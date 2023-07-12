import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_board/demo/h.dart';
import 'package:student_board/screen/admin_screens/admin_home.dart';
import 'package:student_board/screen/login.dart';
import 'package:student_board/screen/student_screens/student_home.dart';
import 'package:student_board/screen/splash.dart';
import 'package:student_board/screen/teacher_screens/teacher_home.dart';

import 'api_services/api_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // final id = null;
// var user;
//   final id = await APIService().getPersonID();
//   try{
//      user = await APIService().getOne("get-user");
//   }catch(e){
//
//
//   }

  // goTo() {
  //   if (user['role'] == "Student") {
  //     return StudentHome();
  //   } else if (user['role'] == "Teacher") {
  //     return const TeacherHome();
  //   } else if (user['role'] == "Admin") {
  //     return const AdminHome();
  //   }
  // }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login()
      // home: (id?.isNotEmpty ?? false) ? goTo() : const SplashScreen(),
    ),
  );
}

//0xFF7b2a23
