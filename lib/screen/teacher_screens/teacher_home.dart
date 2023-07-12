import 'package:flutter/material.dart';
import 'package:student_board/api_models/teacher_models.dart';
import 'package:student_board/api_services/api_services.dart';
import 'package:student_board/screen/login.dart';
import 'package:student_board/screen/teacher_screens/attendance_records.dart';
import 'package:student_board/widget/list_tile.dart';

import '../../constant/constant.dart';
import 'mark_attendance.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  TeacherModel? teacherData;
  List<Subject>? subject = [];
   // Currently selected drawer item index

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    var data = await APIService().getOne("get-user");
    teacherData = TeacherModel.fromJson(data);
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
                title: Text(
                  teacherData?.name ?? 'demo',
                  style: const TextStyle(fontSize: 25, color: primaryColor),
                ),
              ),
               MyListTile(
                label: Text('Home'),
                Icon: Icon(Icons.home),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              MyListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarkAttendance(),
                      ),
                    );
                  },
                  label: const Text('Mark Attendance'),
                  Icon: const Icon(Icons.add_chart_outlined)),
               MyListTile(
                label: Text('Attendance Records'),
                Icon: Icon(Icons.document_scanner),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  const AttendanceRecords()));
                },
              ),
              // const MyListTile(
              //
              //   label: Text('Result Records'),
              //   Icon: Icon(Icons.auto_graph),
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
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("NFC IET Portal"),
          backgroundColor: primaryColor,
        ),
        body: teacherData == null
            ? const Center(
                child: CircularProgressIndicator(color: primaryColor))
            : RefreshIndicator(
                color: primaryColor,
                onRefresh: fetch,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount:
                        teacherData == null ? 0 : teacherData!.subjects.length,
                    itemBuilder: (context, i) {
                      TeacherModel? data = teacherData;
                      return Card(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "${i + 1}",
                            ),
                          ),
                          title: Text(
                              "${data?.subjects[i].subject.session.session_title}     ${data?.subjects[i].subject.program.program_abbreviation}"),
                          subtitle:
                              Text(data!.subjects[i].subject.subjectTitle),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
