import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api_services/api_services.dart';
import '../constant/constant.dart';

class ParentSearched extends StatefulWidget {
  const ParentSearched({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ParentSearched> createState() => _ParentSearchedState();
}

class _ParentSearchedState extends State<ParentSearched> {
  List<dynamic>? data;

  @override
  void initState() {
    _fetchAttendance();
    super.initState();
  }

  Future<void> _fetchAttendance() async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/attendance/calendar-data/${widget.id}",
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
                  ? const Center(
                      child: Text(
                      "No Data Found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black45),
                    ))
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
