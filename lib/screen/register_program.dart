import 'package:flutter/material.dart';
import 'package:stud_board/widget/my_drop_down.dart';
import 'package:stud_board/widget/my_text_formfield.dart';

class RegisterProgram extends StatefulWidget {
  const RegisterProgram({Key? key}) : super(key: key);

  @override
  State<RegisterProgram> createState() => _RegisterProgramState();
}

class _RegisterProgramState extends State<RegisterProgram> {
  String? departvalue;
  String? programvalue;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Department'),
        backgroundColor: Color(0xFF7b2a23),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Enter Program Details',
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
            MyTextFormField(label: 'Program Titile', hint: 'Program Titile'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    'Program Type',
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
                  items: item2.map((String items) {
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
            MyTextFormField(label: "Starting Date", hint: 'Starting Date'),
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
    );
  }
}
