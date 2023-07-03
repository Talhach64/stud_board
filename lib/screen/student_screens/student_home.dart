import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/student_screens/attendance.dart';
import 'package:stud_board/screen/student_screens/scanner.dart';
import 'package:stud_board/widget/list_tile.dart';
import '../../api_models/student_models.dart';
import '../../constant/constant.dart';

class StudentHome extends StatefulWidget {
  StudentHome({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  StudentModel? studentData;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    var data = await APIService().getOne("get-user");
    print(data);
    studentData = StudentModel.fromJson(data);
    print(studentData!.name);
    setState(() {});
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
                title: studentData != null
                    ? Text(studentData!.name,
                        style:
                            const TextStyle(fontSize: 25, color: primaryColor))
                    : const CircularProgressIndicator(),
              ),
               MyListTile(
                label: Text('Home'),
                Icon: Icon(Icons.home),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              MyListTile(
                  label: const Text('Attendance'),
                  Icon: const Icon(Icons.add_chart_outlined),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Attendance()));
                  }),
              MyListTile(
                label: const Text('Scanner'),
                Icon: const Icon(Icons.document_scanner),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRViewExample(),
                    ),
                  );
                },
              ),
              // const MyListTile(
              //
              //
              //   label: Text('Progress'),
              //   Icon: Icon(Icons.auto_graph),
              // ),
              // const MyListTile(
              //
              //   label: Text('Result'),
              //   Icon: Icon(Icons.newspaper),
              // ),
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
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('NFC IET STUDENT PORTAL'),
          backgroundColor: primaryColor,
        ),
        body: const Center(
          child: Text(
            "Progress",
            style: TextStyle(fontSize: 30),
          ),
        ),

      ),
    );
  }
}
