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
  String? formattedDate;

  List<String> subjects = [];
  String? selectedSubject;

  List<String> sections = [];
  String? selectedSection;

  List<String> subjectType = [];
  String? selectedSubjectType;

  List<String> creditHour = [];
  String? selectedCreditHour;

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
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      value: selectedSubjectType,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: subjectType.map((var e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Container(
                //   padding:
                //   const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5.0),
                //       border: Border.all(width: 1)),
                //   child: DropdownButtonHideUnderline(
                //     child: DropdownButton<SectionsModel>(
                //       hint: const Text(
                //         'Section',
                //         style: TextStyle(
                //           color: primaryColor,
                //         ),
                //       ),
                //
                //       isExpanded: true,
                //       // Initial Value
                //       value: selectedSection,
                //
                //       // Down Arrow Icon
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //
                //       // Array list of items
                //       items: sections?.map((var e) {
                //         return DropdownMenuItem(
                //           value: e,
                //           child: Text(e.sectionTitle),
                //         );
                //       }).toList(),
                //       // After selecting the desired option,it will
                //       // change button value to selected value
                //       onChanged: (var newValue) {
                //         updatedStudent = [];
                //         selectedSection = null;
                //         selectedSection = newValue!;
                //         _fetchStudents(
                //             selectedSubject!.subject.department.id,
                //             selectedSubject!.subject.program.id,
                //             selectedSubject!.subject.session.id,
                //             selectedSection!.id);
                //         setState(
                //               () {
                //             print(selectedSubject!.subject.department.id);
                //             print(selectedSubject!.subject.program.id);
                //             print(selectedSubject!.subject.session.id);
                //             print(selectedSubject!.subject.semester.id);
                //             print(selectedSection!.id);
                //             print(selectedSubject!.subject.id);
                //           },
                //         );
                //       },
                //     ),
                //   ),
                // ),
                const SizedBox(height: 15),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text(
                        'Subject Type',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: selectedSubjectType,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: subjectType.map((var e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var newValue) {
                        selectedSubjectType = newValue!;
                        setState(
                              () {},
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text(
                        'Credit Hours',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: selectedCreditHour,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: creditHour.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var newValue) {
                        selectedCreditHour = newValue;
                        setState(
                              () {},
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$formattedDate',
                                style: const TextStyle(fontSize: 15),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: selectedDate,
                                        firstDate:
                                        DateTime((DateTime.now().year - 1)),
                                        lastDate: DateTime(
                                            (DateTime.now().year + 1)));
                                    if (date != null) {
                                      selectedDate = date;
                                    }
                                    formattedDate =
                                        Jiffy.parseFromDateTime(selectedDate)
                                            .yMMMMd;

                                    setState(() {});
                                  },
                                  child: const Icon(
                                    CupertinoIcons.calendar,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // GestureDetector(
                //   onTap: () async {
                //     updatedStudent = students.map((e) {
                //       return AttendanceStudent(
                //         student: e.id,
                //         // Assign the name property from AttendanceStudentDataModel
                //         present: e.present,
                //         leave: e.leave,
                //       );
                //     }).toList();
                //     showDialog(
                //         context: context,
                //         builder: (context) {
                //           return LoadingIcon(label: "Almost Done");
                //         });
                //     try {
                //       var res = await APIService().post(
                //           "attendance/student",
                //           AttendanceStudentsModel(
                //               teacher: teacherData!.id,
                //               department:
                //               selectedSubject!.subject.department.id,
                //               program: selectedSubject!.subject.program.id,
                //               session: selectedSubject!.subject.session.id,
                //               semester:
                //               selectedSubject!.subject.semester.id,
                //               section: selectedSection!.id,
                //               subject: selectedSubject!.subject.id,
                //               subjectType: selectedSubjectType!,
                //               creditHours: selectedCreditHour!,
                //               date: selectedDate,
                //               list: updatedStudent)
                //               .toJson());
                //       if (res['message'] == "success") {
                //         Navigator.pop(context);
                //       }
                //     } catch (e) {
                //       print(e);
                //     }
                //     Navigator.pop(context);
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: primaryColor,
                //       borderRadius: BorderRadius.circular(5.0),
                //     ),
                //     child: const Center(
                //       child: Padding(
                //         padding: EdgeInsets.symmetric(vertical: 16),
                //         child: Text(
                //           "MARK ATTENDANCE",
                //           style: TextStyle(fontSize: 15.0, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
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
                          for (var student in students) {
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
