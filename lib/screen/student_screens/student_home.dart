import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/student_screens/attendance.dart';
import 'package:stud_board/screen/student_screens/scanner.dart';
import 'package:stud_board/widget/list_tile.dart';
import '../../constant/constant.dart';
class StudentHome extends StatefulWidget {

   StudentHome({Key? key,}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
 String name= '';
  @override
  void initState() {
    super.initState();
    fetch();
  }
    void fetch()async{
   var res = await APIService().getOne("get-user");

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
                label: Text('Home'),
                Icon: Icon(Icons.home),
              ),
              MyListTile(
                label: Text('Attendance'),
                Icon: Icon(Icons.add_chart_outlined),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Attendance(),
                  ),
                ),
              ),
              MyListTile(
                label: Text('Scanner'),
                Icon: Icon(Icons.document_scanner),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  ),
                ),
              ),
              const MyListTile(
                label: Text('Progress'),
                Icon: Icon(Icons.auto_graph),
              ),
              const MyListTile(
                label: Text('Result'),
                Icon: Icon(Icons.newspaper),
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
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('NFC IET STiUDENT PORTAL'),
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
