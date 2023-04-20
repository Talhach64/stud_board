import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/admin_screens/register_department.dart';
import 'package:stud_board/screen/admin_screens/register_program.dart';
import 'package:stud_board/screen/admin_screens/register_semester.dart';
import 'package:stud_board/screen/admin_screens/register_session.dart';
import 'package:stud_board/screen/admin_screens/register_student_in_subject.dart';
import 'package:stud_board/screen/admin_screens/register_subject.dart';
import 'package:stud_board/screen/admin_screens/register_teacher_in_subject.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/widget/list_tile.dart';

import '../../constant/constant.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const MyListTile(label: Text('DashBoard'), Icon: Icon(Icons.home)),
              MyListTile(label: const Text('Department'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterDepartment()))),
              MyListTile(label: const Text('Program'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterProgram()))),
              MyListTile(label: const Text('Session'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSession()))),
              MyListTile(label: const Text('Semester'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSemester()))),
              MyListTile(label: const Text('Subject'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSubject()))),
              MyListTile(label: const Text('Student'), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterStudentInSubject()))),
              MyListTile(label: const Text("Teacher's Subject"), Icon: const Icon(Icons.home),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterTeacherInSubject()))),
              const Divider(height: 0),
              MyListTile(
                label: const Text('Log Out'),
                Icon: const Icon(Icons.logout),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  APIService().deleteID("_id");

                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('NFC IET Admin PORTAL'),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Text(
            "DashBoard",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
