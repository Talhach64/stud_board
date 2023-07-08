import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';
import 'package:stud_board/api_models/teacher_models.dart';
import '../../api_models/attendance_models.dart';
import '../../api_models/dpss_models.dart';
import '../../api_models/sheets_model.dart';
import '../../api_services/api_services.dart';
import '../../constant/constant.dart';
import '../../widget/loading_icon.dart';

class UpdateAttendance extends StatefulWidget {
  String id;
   UpdateAttendance({Key? key,required this.id}) : super(key: key);

  @override
  State<UpdateAttendance> createState() => _UpdateAttendanceState();
}

class _UpdateAttendanceState extends State<UpdateAttendance> {

  SheetByID? attendanceSheet;

  List<StudentSheets> list = [];



  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;

  TeacherModel? teacherData;

  DateTime selectedDate = DateTime.now();
  DateTime dateTime = DateTime.now();

  String? formattedDate;

  List<AttendanceStudentDataModel> students = [];
  bool selectAll = false;
  List<AttendanceStudent> updatedStudent = [];

  @override
  void initState() {
    fetchAttendance();
    update();
    // fetchDate();
    super.initState();
  }

  void update(){
    if(attendanceSheet!= null){
    //
    }
  }
  String fetchDate() {
    final parsedDate = DateTime.parse(attendanceSheet!.sheet.date);
    final format = DateFormat('MMMM d, yyyy hh:mm a');
    return format.format(parsedDate.toLocal());
  }

  Future<void> fetchAttendance() async {
    var data = await APIService().getOne("sheet/${widget.id}");
    attendanceSheet = SheetByID.fromJson(data);
    // print(attendanceSheet!.sheet.section.sectionTitle);
    // print(attendanceSheet!.list[0].student.name);
    // print(attendanceSheet!.list[0].present);
    // print(attendanceSheet!.list[0].leave);
    list = attendanceSheet!.list.map((e) => e).toList();
    dateTime = DateTime.parse(attendanceSheet!.sheet.date);

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
  //
  // Future<List<dynamic>?> _fetchStudents(
  //     deptID, progamID, sessionID, sectionID) async {
  //   try {
  //     final response = await Dio().get(
  //       "https://nfc-master-api.onrender.com/api/attendance-student-data?department=$deptID&program=$progamID&session=$sessionID&section=$sectionID",
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${await APIService().getToken()}',
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //       ),
  //     );
  //     List<dynamic> data = response.data;
  //     print(data);
  //     print("here is error");
  //     students =
  //         (data).map((e) => AttendanceStudentDataModel.fromJson(e)).toList();
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
    return
      SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NFC IET Portal"),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Update Student Attendance",
                  style: TextStyle(fontSize: 25.0),
                ),
                const Text(
                  "Enter the Class details",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    updatedStudent = list.map((e) {
                      return AttendanceStudent(
                        student: e.student.id,
                        // Assign the name property from AttendanceStudentDataModel
                        present: e.present,
                        leave: e.leave,
                      );
                    }).toList();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return LoadingIcon(label: "Almost Done");
                        });

                    print(widget.id);
                    print(attendanceSheet!.sheet.id);
                    print(attendanceSheet!.sheet.teacher.id);
                    print(attendanceSheet!.sheet.department.id);
                    print(attendanceSheet!.sheet.program.id);
                    print(attendanceSheet!.sheet.session.id);
                    print(attendanceSheet!.sheet.semester.id);
                    print(attendanceSheet!.sheet.section.id);
                    print(attendanceSheet!.sheet.subject.id);
                    print(attendanceSheet!.sheet.subject.type);
                    print(attendanceSheet!.sheet.creditHours);
                    print(dateTime);
                    print(updatedStudent[0].student);
                    print(updatedStudent[0].present);
                    print(updatedStudent[1].student);
                    print(updatedStudent[1].present);
                    print(updatedStudent[2].student);
                    print(updatedStudent[2].present);


                    //update ni ho rhi attendance , print kr kay dekho, debug kr kay every status and data
                    try {
                      var res = await APIService().put(
                          "attendance/student/${attendanceSheet!.sheet.id}",
                          AttendanceStudentsModel(
                              teacher: attendanceSheet!.sheet.teacher.id,
                              department:
                              attendanceSheet!.sheet.department.id,
                              program:  attendanceSheet!.sheet.program.id,
                              session:  attendanceSheet!.sheet.session.id,
                              semester: attendanceSheet!.sheet.semester.id,
                              section:  attendanceSheet!.sheet.section.id,
                              subject:  attendanceSheet!.sheet.subject.id,
                              // subjectType:  attendanceSheet!.sheet.subject.type,
                              // creditHours:  attendanceSheet!.sheet.creditHours,
                              date:  dateTime,
                              list: updatedStudent)
                              .toJson());
                      Navigator.pop(context);
                      // if (res['message'] == "success") {
                      //   Navigator.pop(context);
                      // }
                    } catch (e) {
                      print(e);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Update ATTENDANCE",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Class Student List",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Select All'),
                    Checkbox(
                      value: selectAll,
                      onChanged: (bool? value) {
                        setState(() {
                          selectAll = value!;
                          for (var student in list) {
                            student.present = value;
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 64)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Present'),
                    SizedBox(width: 10),
                    Text('Leave'),
                    SizedBox(width: 20)
                  ],
                ),
                list.isNotEmpty ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(list[i].student.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: list[i].present,
                            onChanged: list[i].leave
                                ? null // Disable the checkbox when "leave" is checked
                                : (bool? value) {
                              setState(() {
                                list[i].present = value!;
                              });
                            },
                          ),
                          Checkbox(
                            value: list[i].leave,
                            onChanged: (bool? value) {
                              setState(() {
                                list[i].leave = value!;

                                // If "leave" is checked, set "present" to false
                                if (value) {
                                  list[i].present = false;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ) :
                    Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
