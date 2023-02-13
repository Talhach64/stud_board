import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widget/text_widget.dart';

class RegisterSession extends StatefulWidget {
  const RegisterSession({Key? key}) : super(key: key);

  @override
  State<RegisterSession> createState() => _RegisterSessionState();
}

class _RegisterSessionState extends State<RegisterSession> {
  String? departvalue;
  String? sessionvalue;
  String? programvalue;

  final department = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical engineering'
  ];
  final sessionType = [
    'Spring',
    'Fall'
  ];
  final program = [
    'BS',
    'MS'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register Session'),
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Enter Session Details',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  MyTextFormField(label: 'Session Title', hint: 'Session Titile'),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          'Session Type',
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
                        items: sessionType.map((String items) {
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  primaryColor,
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
      ),
    );
  }
}
