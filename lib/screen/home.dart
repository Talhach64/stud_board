import 'package:flutter/material.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/register_department.dart';
import 'package:stud_board/screen/register_program.dart';
import 'package:stud_board/screen/register_semester.dart';
import 'package:stud_board/screen/register_session.dart';
import 'package:stud_board/screen/register_student_in_subject.dart';
import 'package:stud_board/screen/register_subject.dart';
import 'package:stud_board/screen/register_teacher_in_subject.dart';
import 'package:stud_board/widget/list_tile.dart';

import '../constant/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const MyListTile(label: Text('Home'), Icon: Icon(Icons.home)),
              const MyListTile(label: Text('Attendance'), Icon: Icon(Icons.document_scanner)),
              const MyListTile(label: Text('Progress'), Icon: Icon(Icons.auto_graph)),
              const MyListTile(label: Text('Transcript'), Icon: Icon(Icons.newspaper)),
              const MyListTile(label: Text('Certificate'), Icon: Icon(Icons.star)),
              MyListTile(label: const Text('Depart'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterDepartment()))),
              MyListTile(label: const Text('Program'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterProgram()))),
              MyListTile(label: const Text('Session'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSession()))),
              MyListTile(label: const Text('Semester'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSemester()))),
              MyListTile(label: const Text('Subject'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSubject()))),
              MyListTile(label: const Text('Student'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterStudentInSubject()))),
              MyListTile(label: const Text('Teacher'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterTeacherInSubject()))),
              const Divider(height: 0),
              MyListTile(label: const Text('Log Out'), Icon: const Icon(Icons.logout),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())))
            ],),),
        appBar: AppBar(title: const Text('NFC IET STUDENT PORTAL'), backgroundColor: primaryColor,),
        body: const Center(child: Text('Will use Package to show Graph')),
      ),
    );
  }
}
