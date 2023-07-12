import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_board/screen/teacher_screens/update_attendance.dart';
import '../../api_models/sheets_model.dart';
import '../../api_services/api_services.dart';
import '../../constant/constant.dart';

class AttendanceRecords extends StatefulWidget {
  const AttendanceRecords({Key? key}) : super(key: key);

  @override
  State<AttendanceRecords> createState() => _AttendanceRecordsState();
}

class _AttendanceRecordsState extends State<AttendanceRecords> {
  List<SheetsModel>? sheets;

  Future<void> _fetchSheet() async {
    var data = await APIService().getAll("sheets");
    sheets = (data)!.map((e) => SheetsModel.fromJson(e)).toList();
    print(sheets![0].id);
    setState(() {

    });
  }

  String formatDate(String dateString) {
    final parsedDate = DateTime.parse(dateString);
    final format = DateFormat('MMMM d, yyyy hh:mm a');
    return format.format(parsedDate.toLocal());
  }

  @override
  void initState() {
    _fetchSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC IET Portal"),
        backgroundColor: primaryColor,
      ),
      body: sheets == null
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor))
          : RefreshIndicator(
              color: primaryColor,
              onRefresh: _fetchSheet,
              child: sheets!.isEmpty
                  ? const Center(
                      child: Text(
                      "No Data Found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black45),
                    ))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Department',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Program',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Session',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Section',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Semester',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Subject - Code',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Marked on',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            ...sheets!.map(
                              (e) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(e.department.department_name),
                                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));}),
                                  DataCell(
                                      Text(e.program.program_abbreviation), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                  DataCell(Text(e.session.session_title), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                  DataCell(Text(e.section.sectionTitle), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                  DataCell(Text(e.semester.semester_title), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                  DataCell(Text(
                                      "${e.subject.subjectTitle} - ${e.subject.subjectCode}"), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                  DataCell(Text(formatDate(e.date)), onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdateAttendance(id: e.id,)));
                                  }),
                                ],

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
