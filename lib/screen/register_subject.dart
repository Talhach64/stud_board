import 'package:flutter/material.dart';

import '../widget/my_text_formfield.dart';

class RegisterSubject extends StatefulWidget {
  const RegisterSubject({Key? key}) : super(key: key);

  @override
  State<RegisterSubject> createState() => _RegisterSubjectState();
}

class _RegisterSubjectState extends State<RegisterSubject> {
  String? departvalue;
  String? semesterTypevalue;
  String? programvalue;
  String? subjectTypevalue;
  String? sessionvalue;

  final department = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical engineering'
  ];
  final semesterType = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
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
  final subjectType = [
    'Core',
    'Elective',
    'Supply',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Subject'),
        backgroundColor: Color(0xFF7b2a23),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Enter Subject Details',
                style: TextStyle(fontSize: 25),
              ),
              MyTextFormField(label: "Sunject Code", hint: 'Sunject Code'),
              MyTextFormField(label: "Subject Title", hint: 'Subject Title'),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(
                      'Subject Title',
                      style: TextStyle(
                        color: Color(0xFF7b2a23),
                      ),
                    ),

                    isExpanded: true,
                    // Initial Value
                    value: subjectTypevalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: subjectType.map((String items) {
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
                              subjectTypevalue = newValue!;
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
                        color: Color(0xFF7b2a23),
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
                        color: Color(0xFF7b2a23),
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
                      'Session',
                      style: TextStyle(
                        color: Color(0xFF7b2a23),
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
                        color: Color(0xFF7b2a23),
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
              SizedBox(height: 10),

              Text(
                'Theory Credit Hour Slider',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Lab Credit Hour Slider',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7b2a23),
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
    );
  }
}
