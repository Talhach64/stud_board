import 'package:event_schedule_calendar/event_schedule_calendar.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 933,
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: EventScheduleCalendar(
              dateTime: DateTime.now(),
              eventList: [
                Event(
                  name: 'event1',
                  dateTime: DateTime(2023, 4, 1),
                  color: Colors.brown,
                ),
                Event(
                  name: 'event2',
                  dateTime: DateTime(2023, 4, 5),
                  color: Colors.brown,
                ),
                Event(
                  name: 'event3',
                  dateTime: DateTime(2023, 4, 10),
                  color: Colors.brown,
                ),
                Event(
                  name: 'event 4',
                  dateTime: DateTime(2023, 4, 15),
                  color: Colors.red,
                ),
                Event(
                  name: 'event 5',
                  dateTime: DateTime(2023, 4, 20),
                  color: Colors.green,
                ),
                Event(
                  name: 'event 6',
                  dateTime: DateTime(2023, 4, 25),
                  color: Colors.blue,
                ),
              ],
              config: CalendarConfig(),
              onTapDay: (day) {
                showDialog<AlertDialog>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(day.dateTime.toString()),
                          ...day.eventList.map((e) => Text(e.name)),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
