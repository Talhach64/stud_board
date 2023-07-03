import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AttendanceRecords extends StatefulWidget {
  const AttendanceRecords({Key? key}) : super(key: key);

  @override
  State<AttendanceRecords> createState() => _AttendanceRecordsState();
}

class _AttendanceRecordsState extends State<AttendanceRecords> {
  Future<void> fun()async {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC IET Portal"),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: fun,
          child: const CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
