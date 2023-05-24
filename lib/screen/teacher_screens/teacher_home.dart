import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/student_screens/scanner.dart';
import 'package:stud_board/widget/list_tile.dart';

import '../../constant/constant.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  String name= '';
  @override
  void initState() {
    super.initState();
    fetch();
  }
  void fetch()async{
    var res = await APIService().getOne("get-user");
    print(res);

    setState(() {
      name = res['name'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  name,
                  style: const TextStyle(fontSize: 25, color: primaryColor),
                ),
              ),
              const MyListTile(
                label: Text('Dashboard'),
                Icon: Icon(Icons.home),
              ),
              const MyListTile(
                  label: Text('Mark Attendance'),
                  Icon: Icon(Icons.add_chart_outlined)),
              MyListTile(
                label: Text('Attendance Records'),
                Icon: Icon(Icons.document_scanner),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  ),
                ),
              ),
              const MyListTile(
                label: Text('Result Forms'),
                Icon: Icon(Icons.auto_graph),
              ),



              const Divider(height: 0),
              MyListTile(
                label: const Text('Log Out'),
                Icon: const Icon(Icons.logout),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                  APIService().deleteID("_id");
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("TEACHER'S PORTAL"),
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
