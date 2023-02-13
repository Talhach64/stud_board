import 'package:flutter/material.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/demo_APIservies.dart';
import 'package:stud_board/widget/text_widget.dart';

import '../constant/constant.dart';

class RegisterProgram extends StatefulWidget {
  const RegisterProgram({Key? key}) : super(key: key);

  @override
  State<RegisterProgram> createState() => _RegisterProgramState();
}

class _RegisterProgramState extends State<RegisterProgram> {
  String? departValue;
  String? programValue;

  final department = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical engineering'
  ];
  final item2 = [
    '1 Year',
    '2 Year',
    '3 Year',
    '4 Year',
    '5 Year',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Register Program'),
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Enter Program Details',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text(
                          'Department',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),

                        isExpanded: true,
                        // Initial Value
                        value: departValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: department.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will change button value to selected value
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              departValue = newValue!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const MyTextFormField(
                      label: 'Program Titile', hint: 'Program Titile'),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text(
                          'Program Type',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),

                        isExpanded: true,
                        // Initial Value
                        value: programValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: item2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will change button value to selected value
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              programValue = newValue!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const MyTextFormField(
                      label: "Starting Date", hint: 'Starting Date'),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
