import 'package:flutter/material.dart';
import 'package:stud_board/screen/home.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/register.dart';
import 'package:stud_board/widget/my_text_formfield.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    //home: Login(),
    //home: Register(),
  ),
  );
}


//0xFF7b2a23