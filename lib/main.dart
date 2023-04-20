import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stud_board/screen/student_screens/student_home.dart';
import 'package:stud_board/screen/splash.dart';

import 'api_services/api_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // final id = null;
  final id = await APIService().getPersonID();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (id?.isNotEmpty ?? false) ? StudentHome() : const Splash(),
    ),
  );
}

//0xFF7b2a23
// Created Department , Program , Session , Semester, Subject, Student , Teacher screens
