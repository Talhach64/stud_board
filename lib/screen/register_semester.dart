import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widget/text_widget.dart';

class RegisterSemester extends StatefulWidget {
  const RegisterSemester({Key? key}) : super(key: key);

  @override
  State<RegisterSemester> createState() => _RegisterSemesterState();
}

class _RegisterSemesterState extends State<RegisterSemester> {
  String? departvalue;
  String? semesterTypevalue;
  String? programvalue;
  String? semesterTitlevalue;
  String? sessionvalue;

  final department = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical engineering'
  ];
  final semesterType = [
    'Summer',
    'Winter'
  ];
  final program = [
    'BS',
    'MS'
  ];
  final session = [
    '2k19',
    '2k20',
    '2k21',
  ];
  final semesterTitle = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register Semester'),
          backgroundColor: primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Enter Semester Details',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Semester Title',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: semesterTitlevalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: semesterTitle.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(
                              () {
                                semesterTitlevalue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Semester Type',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: semesterTypevalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: semesterType.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(
                              () {
                                semesterTypevalue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                MyTextFormField(label: "Starting Year", hint: 'Starting Year'),
                MyTextFormField(label: "Ending Year", hint: 'Ending Year'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Department',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: departvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: department.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(
                              () {
                            departvalue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Program',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: programvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: program.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(
                              () {
                            programvalue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Department',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),

                      isExpanded: true,
                      // Initial Value
                      value: sessionvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: session.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(
                              () {
                                sessionvalue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
