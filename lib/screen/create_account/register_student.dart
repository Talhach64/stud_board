import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_models/dpss_model.dart';
import 'package:stud_board/api_models/student_model.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/login.dart';
import 'package:stud_board/widget/img.dart';
import 'package:stud_board/widget/text_widget.dart';
import '../../constant/constant.dart';
import '../../widget/loading_icon.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  late String email;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final PageController _controller = PageController();

  int _currentIndex = 0;
  bool obscure = true;
  bool obscure1 = true;
  bool emailCheck = true;

  List<DepartmentsModel>? departments = [];
  DepartmentsModel? selectedDepartment;

  List<ProgramsModel>? programs = [];
  ProgramsModel? selectedProgram;

  List<SessionsModel>? session = [];
  SessionsModel? selectedSession;

  List<SectionsModel>? sections = [];
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
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>?> _fetchPrograms(deptID) async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/programs?department=$deptID",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      List<dynamic> data = response.data;
      programs = (data).map((e) => ProgramsModel.fromJson(e)).toList();
      setState(() {});
    } catch (error) {
      print(error);
      return null;
    }

    return null;
  }

  Future<List<dynamic>?> _fetchSession(deptID, progamID) async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/sessions?department=$deptID&program=$progamID",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      List<dynamic> data = response.data;

      session = (data).map((e) => SessionsModel.fromJson(e)).toList();

      setState(() {});
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

  Future<List<dynamic>?> _fetchSection(deptID, progamID, sessionID) async {
    try {
      final response = await Dio().get(
        "https://nfc-master-api.onrender.com/api/sections?department=$deptID&program=$progamID&session=$sessionID",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      List<dynamic> data = response.data;
      print(response.data);
      print("here is error");
      sections = (data).map((e) => SectionsModel.fromJson(e)).toList();
      print("error");

      setState(() {});
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

  Future<dynamic>? registerStudent() async {
    try {
      final response = await Dio().post(
        "https://nfc-master-api.onrender.com/api/student/register",
        data: StudentModel(
                department: selectedDepartment?.id,
                program: selectedProgram?.id,
                session: selectedSession?.id,
                section: selectedSection?.id,
                name: nameController.text,
                email: email,
                rollNo: rollNoController.text,
                phoneNo: phoneController.text,
                password: passwordController.text)
            .toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await APIService().getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      emailCheck = true;

      print("---------1--------");
      print(response.data);
      print("-------2-----------");
      return response.data['email'];
    } catch (e) {
      print(e);
      emailCheck = false;
      return "already in use";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Form(
            autovalidateMode: autoValidateMode,
            key: _formKey,
            child: SizedBox(
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
                      // padding: const EdgeInsets.all(20.0),
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
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
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
                                  selectedProgram = null;
                                  selectedSession = null;
                                  selectedSection = null;
                                  selectedDepartment = newValue!;
                                  _fetchPrograms(selectedDepartment?.id);
                                  setState(
                                    () {},
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<ProgramsModel>(
                                hint: Text(
                                  'Programs',
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),

                                isExpanded: true,

                                // Initial Value
                                value: selectedProgram,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: programs?.map((var e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e.programAbbreviation),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (var newValue) {
                                  selectedProgram = newValue!;
                                  selectedSession = null;
                                  selectedSection = null;
                                  _fetchSession(selectedDepartment?.id,
                                      selectedProgram?.id);

                                  setState(
                                    () {},
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<SessionsModel>(
                                hint: const Text(
                                  'Session',
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),

                                isExpanded: true,
                                // Initial Value
                                value: selectedSession,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: session?.map((var e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e.sessionTitle),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (var newValue) {
                                  selectedSession = newValue!;
                                  selectedSection = null;
                                  _fetchSection(selectedDepartment!.id,
                                      selectedProgram!.id, selectedSession!.id);
                                  setState(
                                    () {},
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<SectionsModel>(
                                hint: const Text(
                                  'Section',
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),

                                isExpanded: true,
                                // Initial Value
                                value: selectedSection,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: sections?.map((var e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e.sectionTitle),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (var newValue) {
                                  selectedSection = newValue!;
                                  setState(
                                    () {},
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedDepartment != null &&
                                  selectedProgram != null &&
                                  selectedSession != null &&
                                  selectedSection != null) {
                                _controller.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('These fields are required')));
                              }
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
                      child: Column(
                        children: [
                          const Img(),
                          const SizedBox(height: 10),
                          const Text(
                            'Enter Personal Information',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(height: 15),
                          MyTextFormField(
                              label: "Full Name",
                              hint: "Full Name",
                              controller: nameController,
                              validator: (String? value) => value!.isEmpty
                                  ? "This field is required"
                                  : null),
                          MyTextFormField(
                              label: "Phone NO",
                              hint: "Phone NO",
                              controller: phoneController,
                              validator: (String? value) => value!.isEmpty
                                  ? "This field is required"
                                  : null),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
                              label: "Class Roll No",
                              hint: "Class Roll No",
                              controller: rollNoController,
                              validator: (String? value) => value!.isEmpty
                                  ? "This field is required"
                                  : null),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  (selectedGender != null)) {
                                _controller.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                                email =
                                    "${selectedSession!.sessionTitle}${selectedProgram!.programAbbreviation}${rollNoController.text}@undergrad.nfciet.edu.pk";
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Gender is required')));
                                setState(() {});
                              }
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
                      // padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Img(),
                          const SizedBox(height: 10),
                          const Text(
                            'Almost Done',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              obscureText: obscure,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validator: (String? value) =>
                                  value!.isEmpty || value.length < 8
                                      ? "Password must be at-least 8 characters"
                                      : null,
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: primaryColor),
                                hintText: "Password",
                                labelText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: () =>
                                      setState(() => obscure = !obscure),
                                  child: obscure
                                      ? const Icon(
                                          Icons.visibility,
                                          color: primaryColor,
                                        )
                                      : const Icon(Icons.visibility_off,
                                          color: primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              obscureText: obscure1,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) => value!.isEmpty ||
                                      passwordController.text !=
                                          confirmPasswordController.text
                                  ? "Password does not match"
                                  : null,
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: primaryColor),
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                suffixIcon: GestureDetector(
                                  onTap: () =>
                                      setState(() => obscure1 = !obscure1),
                                  child: obscure1
                                      ? const Icon(
                                          Icons.visibility,
                                          color: primaryColor,
                                        )
                                      : const Icon(Icons.visibility_off,
                                          color: primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            // 2k19bscs340@undergrad.nfciet.edu.pk
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return LoadingIcon(label: "Registering");
                                    });
                                var res = await registerStudent();
                                Navigator.pop(context);
                                print(res);
                                // ignore: use_build_context_synchronously
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          content: emailCheck
                                              ? Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("Your email is : $res",
                                                      style: const TextStyle(
                                                          color: Colors.red)),
                                                  ElevatedButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                      Navigator.push(
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
                                                      'Login Now',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: 15),
                                                    ),
                                                  ),


                                                ],
                                              )
                                              : const Text("This email is already in use",
                                                  style: TextStyle(
                                                      color: Colors.red)));
                                    });

                                setState(() {});
                              } else {
                                setState(() {});
                              }
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
      ),
    );
  }
}
