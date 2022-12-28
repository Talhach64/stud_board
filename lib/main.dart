import 'package:flutter/material.dart';
import 'package:stud_board/screen/home.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/register.dart';
import 'package:stud_board/screen/register_department.dart';
import 'package:stud_board/screen/register_semester.dart';

import 'package:stud_board/screen/register_session.dart';
import 'package:stud_board/screen/register_subject.dart';
import 'package:stud_board/widget/my_text_formfield.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterSubject(),
    //home: Login(),
    //home: Register(),
  ),
  );
}


//0xFF7b2a23
// Created Departmment , Program , Session , Semester, Subject, Student , Teacher screens