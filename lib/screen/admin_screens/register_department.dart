import 'package:flutter/material.dart';
import 'package:stud_board/widget/text_widget.dart';

import '../../constant/constant.dart';

class RegisterDepartment extends StatefulWidget {
  const RegisterDepartment({Key? key}) : super(key: key);

  @override
  State<RegisterDepartment> createState() => _RegisterDepartmentState();
}

class _RegisterDepartmentState extends State<RegisterDepartment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register Department'),
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Enter Department Details',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(label: "Department Name", hint: 'Department Name'),
                      MyTextFormField(label: 'Department Abbrevation', hint: "Department Abbrevation"),
                      MyTextFormField(label: 'Department Latitude', hint: 'Department Latitude'),
                      MyTextFormField(label: 'Department Longitude', hint: 'Department Longitude'),
                      MyTextFormField(label: 'No of Programs', hint: 'No of Programs'),
                      MyTextFormField(label: 'Department Deacription', hint: 'Department Description'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
