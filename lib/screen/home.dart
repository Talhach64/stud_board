import 'package:flutter/material.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/register_department.dart';
import 'package:stud_board/screen/register_program.dart';
import 'package:stud_board/screen/register_semester.dart';
import 'package:stud_board/screen/register_session.dart';
import 'package:stud_board/screen/register_subject.dart';

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
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text('Attendance'),
              ),
              ListTile(
                leading: Icon(Icons.auto_graph),
                title: Text('Progress'),
              ),
              ListTile(
                leading: Icon(Icons.newspaper),
                title: Text('Transcript'),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Certificate'),
              ),

              ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterDepartment())),
                leading: Icon(Icons.home),
                title: Text('UG-Depart'),
              ),
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterProgram())),
                leading: Icon(Icons.home),
                title: Text('UG-Program'),
              ),
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterSession())),
                leading: Icon(Icons.home),
                title: Text('UG-Session'),
              ),
              ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterSemester())),
                leading: Icon(Icons.home),
                title: Text('UG-Semester'),
              ),
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterSubject())),
                leading: Icon(Icons.home),
                title: Text('UG-Subject'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('IG-Depart'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('IG-Program'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Semester'),
              ),
              Divider(height: 0),
              ListTile(onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login())),
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('NFC IET STUDENT PORTAL'),
          backgroundColor: Color(0xFF7b2a23),
        ),
        body: Center(
          child: Text('Will use Package to show Graph'),
        ),
      ),
    );
  }
}
