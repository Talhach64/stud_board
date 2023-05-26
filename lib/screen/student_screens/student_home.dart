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
  int _selectedIndex = 0; // Currently selected drawer item index

  void _onDrawerItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Closes the drawer
  }

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
                onTap: () => _onDrawerItemTap(0),
                selected: _selectedIndex == 0,
                label: Text('Home'),
                Icon: Icon(Icons.home),
              ),
              MyListTile(
                  selected: _selectedIndex == 1,
                  label: Text('Attendance'),
                  Icon: Icon(Icons.add_chart_outlined),
                  onTap: () {
                    _onDrawerItemTap(1);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Attendance()));
                  }),
              MyListTile(
                selected: _selectedIndex == 2,
                label: Text('Scanner'),
                Icon: Icon(Icons.document_scanner),
                onTap: () {
                  _onDrawerItemTap(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRViewExample(),
                    ),
                  );
                },
              ),
              MyListTile(
                onTap: () => _onDrawerItemTap(3),
                selected: _selectedIndex == 3,
                label: Text('Progress'),
                Icon: Icon(Icons.auto_graph),
              ),
              MyListTile(
                onTap: () => _onDrawerItemTap(4),
                selected: _selectedIndex == 4,
                label: Text('Result'),
                Icon: Icon(Icons.newspaper),
              ),
              const Divider(height: 0),
              MyListTile(
                selected: false,
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
            "DashBoard",
            style: TextStyle(fontSize: 30),
          ),
        ),

      ),
    );
  }
}
