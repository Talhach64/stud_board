import 'package:flutter/material.dart';
import 'package:stud_board/api_models/departments_model.dart';
import 'package:stud_board/api_models/programs_model.dart';
import 'package:stud_board/api_models/sections_model.dart';
import 'package:stud_board/api_models/sessions_model.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/widget/img.dart';
import 'package:stud_board/widget/pass_widget.dart';
import 'package:stud_board/widget/text_widget.dart';
import '../../constant/constant.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool click = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final PageController _controller = PageController();
  int _currentIndex = 0;

  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;
  List<ProgramsModel> programs = [];
  ProgramsModel? selectedProgram;
  List<SessionsModel> session = [];
  SessionsModel? selectedSession;
  List<SectionsModel> sections = [];
  SectionsModel? selectedSection;

  List gender = ["Male", "Female", "Other"];
  String? selectedGender;

  @override
  void initState() {
    _fetchDepartments();
    super.initState();
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
  // void _fetchPrograms() async {
  //   try {
  //     departments = (await APIService().getAll("departments"))
  //         ?.map((e) => DepartmentsModel.fromJson(e))
  //         .toList();
  //     // departments?.forEach((element) {print(element.departmentName);});
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // void _fetchSession() async {
  //   try {
  //     departments = (await APIService().getAll("departments"))
  //         ?.map((e) => DepartmentsModel.fromJson(e))
  //         .toList();
  //     // departments?.forEach((element) {print(element.departmentName);});
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // void _fetchSection() async {
  //   try {
  //     departments = (await APIService().getAll("departments"))
  //         ?.map((e) => DepartmentsModel.fromJson(e))
  //         .toList();
  //     // departments?.forEach((element) {print(element.departmentName);});
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SizedBox(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _controller,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Img(),
                        const SizedBox(height: 10),
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
                        SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<DepartmentsModel>(
                              hint: const Text(
                                'Programs',
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
                        SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<DepartmentsModel>(
                              hint: const Text(
                                'Session',
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
                        SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<DepartmentsModel>(
                              hint: const Text(
                                'Section',
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
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            _controller.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
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
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Img(),
                        const SizedBox(height: 10),
                        const Text(
                          'Enter Personal Information',
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 15),
                        MyTextFormField(label: "Full Name", hint: "Full Name"),
                        MyTextFormField(label: "Phone NO", hint: "Phone NO"),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(width: 1, color: primaryColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: const Text(
                                'Gender',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),

                              isExpanded: true,
                              // Initial Value
                              value: selectedGender,

                              // Down Arrow Icon
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: primaryColor,
                              ),

                              // Array list of items
                              items: gender.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    selectedGender = newValue! as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        MyTextFormField(
                            label: "Class Roll No", hint: "Class Roll No"),
                        ElevatedButton(
                          onPressed: () {
                            _controller.animateToPage(
                              2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
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
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Img(),
                        SizedBox(height: 10),
                        const Text(
                          'Almost Done',
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 15),
                        MyPassField(
                            label: "Password",
                            hint: "Password",
                            controller: passwordController,
                            keyboard: TextInputType.text),
                        MyPassField(
                            label: "ConfirmPassword",
                            hint: "ConfirmPassword",
                            controller: confirmPasswordController,
                            keyboard: TextInputType.text),
                        ElevatedButton(
                          onPressed: () {
                            _controller.animateToPage(
                              2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Login()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            fixedSize: const Size(120, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),

                        ),
                      ],
                    ),
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
