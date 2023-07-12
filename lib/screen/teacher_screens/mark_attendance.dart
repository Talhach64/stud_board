import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:student_board/api_models/teacher_models.dart';
import '../../api_models/attendance_models.dart';
import '../../api_models/dpss_models.dart';
import '../../api_services/api_services.dart';
import '../../constant/constant.dart';
import '../../widget/loading_icon.dart';

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({Key? key}) : super(key: key);

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;

  TeacherModel? teacherData;
  DateTime selectedDate = DateTime.now();
  String? formattedDate;

  List<String>? subjects = [];
  Subject? selectedSubject;

  List<SectionsModel>? sections = [];
  SectionsModel? selectedSection;

  List<String> subjectType = ["Theory", "lab"];
  String? selectedSubjectType;

  List<String> creditHour = ["1", "2", "3", "4", "5"];
  String? selectedCreditHour;

  List<AttendanceStudentDataModel> students = [];
  bool selectAll = false;
  List<AttendanceStudent> updatedStudent = [];

  @override
  void initState() {
    fetch();
    fetchDate();
    super.initState();
  }

  void fetchDate() {
    formattedDate = Jiffy.parseFromDateTime(DateTime.now()).yMMMMd;
  }

  Future<void> fetch() async {
    var user = await APIService().getOne("get-user");
    teacherData = TeacherModel.fromJson(user);
    // print(teacherData!.subjects[1].subject.department.id);

    setState(() {});
  }

  Future<List<dynamic>?> _fetchSection(deptID, progamID, sessionID) async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/sections?department=$deptID&program=$progamID&session=$sessionID",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      List<dynamic> data = response.data;
      print(response.data);
      print("here is error");
      sections = (data).map((e) => SectionsModel.fromJson(e)).toList();
      print("error");

      setState(() {});
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

  Future<List<dynamic>?> _fetchStudents(
      deptID, progamID, sessionID, sectionID) async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/attendance-student-data?department=$deptID&program=$progamID&session=$sessionID&section=$sectionID",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      List<dynamic> data = response.data;
      print(data);
      print("here is error");
      students =
          (data).map((e) => AttendanceStudentDataModel.fromJson(e)).toList();
      print("error");

      setState(() {});
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mark Student Attendance",
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
                    child: DropdownButton(
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
                      items: teacherData?.subjects.map((var e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.subject.subjectTitle),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var newValue) {
                        selectedSection = null;
                        selectedSubject = newValue!;
                        _fetchSection(
                            selectedSubject!.subject.department.id,
                            selectedSubject!.subject.program.id,
                            selectedSubject!.subject.session.id);
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
                    child: DropdownButton<SectionsModel>(
                      hint: const Text(
                        'Section',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: selectedSection,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: sections?.map((var e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.sectionTitle),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var newValue) {
                        updatedStudent = [];
                        selectedSection = null;
                        selectedSection = newValue!;
                        _fetchStudents(
                            selectedSubject!.subject.department.id,
                            selectedSubject!.subject.program.id,
                            selectedSubject!.subject.session.id,
                            selectedSection!.id);
                        setState(
                          () {
                            print(selectedSubject!.subject.department.id);
                            print(selectedSubject!.subject.program.id);
                            print(selectedSubject!.subject.session.id);
                            print(selectedSubject!.subject.semester.id);
                            print(selectedSection!.id);
                            print(selectedSubject!.subject.id);
                          },
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
                GestureDetector(
                  onTap: () async {
                    updatedStudent = students.map((e) {
                      return AttendanceStudent(
                        student: e.id,
                        present: e.present,
                        leave: e.leave,
                      );
                    }).toList();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return LoadingIcon(label: "Almost Done");
                        });
                    try {
                      var res = await APIService().post(
                          "attendance/student",
                          AttendanceStudentsModel(
                                  teacher: teacherData!.id,
                                  department: selectedSubject!.subject.department.id,
                                  program: selectedSubject!.subject.program.id,
                                  session: selectedSubject!.subject.session.id,
                                  semester: selectedSubject!.subject.semester.id,
                                  section: selectedSection!.id,
                                  subject: selectedSubject!.subject.id,
                                  subjectType: selectedSubjectType!,
                                  creditHours: selectedCreditHour!,
                                  date: selectedDate,
                                  list: updatedStudent)
                              .toJson());
                      if (res['message'] == "success") {
                        Navigator.pop(context);
                      }
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
                          "MARK ATTENDANCE",
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(students[i].name!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: students[i].present,
                            onChanged: students[i].leave
                                ? null // Disable the checkbox when "leave" is checked
                                : (bool? value) {
                                    setState(() {
                                      students[i].present = value!;
                                    });
                                  },
                          ),
                          Checkbox(
                            value: students[i].leave,
                            onChanged: (bool? value) {
                              setState(() {
                                students[i].leave = value!;

                                // If "leave" is checked, set "present" to false
                                if (value) {
                                  students[i].present = false;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
