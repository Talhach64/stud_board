import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:intl/intl.dart';
import 'package:stud_board/constant/constant.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List<dynamic>? data;

  @override
  void initState() {
    _fetchAttendance();
    super.initState();
  }

  Future<void> _fetchAttendance() async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/attendance/student/calendar-data",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      data = response.data;
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  String transformDateFormat(String originalDate) {
    DateTime dateTime = DateTime.parse(originalDate);
    String transformedDate = DateFormat('MMM-dd-yyyy').format(dateTime);
    return transformedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Previous Attendance"),
      ),
      body: data == null
          ? const Center(child: CircularProgressIndicator(color: primaryColor))
          : RefreshIndicator(
              color: primaryColor,
              onRefresh: _fetchAttendance,
              child: data!.isEmpty
                  ? const Center(child: Text("No Data Found", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.black45),))
                  : ListView.builder(
                      itemCount: data == null ? 0 : data!.length,
                      itemBuilder: (context, i) {
                        return Card(
                          color: data![i]['color'] == '#ef5350'
                              ? Colors.red
                              : Colors.green,
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "${i + 1}",
                              ),
                            ),
                            title: Text(data![i]['title']),
                            trailing: Text(
                              transformDateFormat(data![i]['date']),
                            ),
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}
