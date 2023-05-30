import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_models/teacher_models.dart';

import '../../api_models/dpss_models.dart';
import '../../api_services/api_services.dart';
import '../../constant/constant.dart';

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({Key? key}) : super(key: key);

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {

  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;

  TeacherModel? teacherData;

  List<String>? subjects = [];
  String? selectedSubject;
  //
  // List<SectionsModel>? sections = [];
  // SectionsModel? selectedSection;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    var user = await APIService().getOne("get-user");
    teacherData = TeacherModel.fromJson(user);
    for (var e in teacherData!.subjects) {
      subjects?.add(e.subject.subjectTitle);
    }
    print(subjects);
    setState(() {});
  }
  // Future<List<dynamic>?> _fetchSection(deptID, progamID, sessionID) async {
  //   try {
  //     final response = await Dio().get(
  //       "https://nfc-master-api.onrender.com/api/sections?department=$deptID&program=$progamID&session=$sessionID",
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${await APIService().getToken()}',
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //       ),
  //     );
  //     List<dynamic> data = response.data;
  //     print(response.data);
  //     print("here is error");
  //     sections = (data).map((e) => SectionsModel.fromJson(e)).toList();
  //     print("error");
  //
  //     setState(() {});
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  //   return null;
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NFC IET Portal"),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Mark Student Attendance",style: TextStyle(fontSize: 25.0),),
                const Text("Enter the Class details",style: TextStyle(fontSize: 18.0),),
                 const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text(
                        'Subject',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      isExpanded: true,
                      // Initial Value
                      value: selectedSubject,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: subjects?.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var newValue) {

                        selectedSubject = newValue!;

                        // _fetchSection(selectedDepartment!.id, selectedProgram!.id, selectedSession!.id);

                        // _fetchPrograms(selectedDepartment?.id);
                        setState(
                              () {},
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
