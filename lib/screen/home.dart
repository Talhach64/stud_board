import 'package:flutter/material.dart';

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
            children: const [
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
                leading: Icon(Icons.home),
                title: Text('UG-Depart'),


              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('UG-Program'),


              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('UG-Session'),


              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('UG-Semester'),


              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),


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
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),


              ),
            ],
          ),
        ),
        appBar: AppBar(title: Text('NFC IET STUDNET PORTAL'),),
      ),
    );
  }
}
