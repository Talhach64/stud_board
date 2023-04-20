import 'package:event_schedule_calendar/event_schedule_calendar.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/screen/student_screens/scanner.dart';
import 'package:stud_board/widget/list_tile.dart';
import '../../constant/constant.dart';


// register student ka forn complete krna hay

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const MyListTile(label: Text(), Icon: Icon(Icons.home)),
              const MyListTile(label: Text('Home'), Icon: Icon(Icons.home)),
              const MyListTile(
                  label: Text('Attendance'),
                  Icon: Icon(Icons.add_chart_outlined)),
               MyListTile(
                  label: Text('Scanner'), Icon: Icon(Icons.document_scanner),onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) =>  QRViewExample()))),
              const MyListTile(
                  label: Text('Progress'), Icon: Icon(Icons.auto_graph)),
              const MyListTile(
                  label: Text('Transcript'), Icon: Icon(Icons.newspaper)),
              const MyListTile(
                  label: Text('Certificate'), Icon: Icon(Icons.star)),
             const Divider(height: 0),
              MyListTile(
                label: const Text('Log Out'),
                Icon: const Icon(Icons.logout),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  APIService().deleteID("_id");

                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('NFC IET STUDENT PORTAL'),
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
      )
    );
  }
}
