import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_models/departments_model.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/widget/button.dart';
import 'package:stud_board/widget/loading_icon.dart';
import 'package:stud_board/widget/text_widget.dart';
import '../../constant/constant.dart';
import '../../widget/pass_widget.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterParentState();
}

class _RegisterParentState extends State<RegisterStudent> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;

  List<String> program = [];
  List<String> session = [];
  List<String> section = [];

  @override
  void initState() {
    _fetchDepartments();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _fetchDepartments() async {
    try {
      departments = (await APIService().getAll("departments"))
          ?.map((e) => DepartmentsModel.fromJson(e))
          .toList();
      // departments?.forEach((element) {print(element.departmentName);});
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: PageView(
            // controller: _controller,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("images/nfc_logo.jpg"),
                    ),
                    const Text(
                      'Enter University Information',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<DepartmentsModel>(
                          hint: const Text(
                            'Department',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),

                          isExpanded: true,
                          // Initial Value
                          value: selectedDepartment,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: departments?.map((var e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.departmentName),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (var newValue) {
                            setState(
                                  () {
                                selectedDepartment = newValue!;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: const Size(120, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
