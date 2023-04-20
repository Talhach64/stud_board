// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stud_board/api_models/login_model.dart';
import 'package:stud_board/api_services/api_services.dart';
import 'package:stud_board/screen/student_screens/student_home.dart';
import 'package:stud_board/screen/register.dart';
import 'package:stud_board/screen/teacher_screens/teacher_home.dart';
import 'package:stud_board/widget/img.dart';
import 'package:stud_board/widget/loading_icon.dart';
import 'package:stud_board/widget/text_widget.dart';

import '../api_models/student_model.dart';
import '../constant/constant.dart';
import '../widget/pass_widget.dart';
import 'admin_screens/admin_home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController.text = "2k19bscs340@undergrad.nfciet.edu.pk";
    passwordController.text = "admin123";
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              autovalidateMode: autoValidateMode,
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 5.0),
                  Img(),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 35),
                  ),
                  MyTextFormField(
                      label: 'Email',
                      hint: 'Email',
                      controller: emailController,
                      validator: (String? value) =>
                          value!.isEmpty ? "Invalid Email or Password" : null),
                  MyPassField(
                    label: 'Password',
                    hint: 'Password',
                    controller: passwordController,
                    keyboard: TextInputType.text,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const Register()));
                  //   },
                  //   child: const Text(
                  //     'Register Instead?',
                  //     style:
                  //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return LoadingIcon(label: "Logging In...");
                            });
                        var token = await APIService().post(
                            "login",
                            LoginModel(
                                    email:
                                        emailController.text,
                                    password: passwordController.text)
                                .toJson());
                        await APIService().setToken(token);
                        var person = await APIService().getOne("get-user");
                        await APIService().setPersonID(person["_id"]);
                        Navigator.pop(context);
                        if(person['role']=="Student")
                          {
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  StudentHome()));}
                        else if(person['role']=="Teacher")
                        { Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherHome()));}
                        else if(person['role']=="Admin")
                        { Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminHome()));}
                      } else {
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: const Size(100, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'SIGN IN',
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
