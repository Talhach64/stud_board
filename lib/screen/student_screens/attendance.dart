import 'package:event_schedule_calendar/event_schedule_calendar.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Record'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container()
      ),
    );
  }
}
