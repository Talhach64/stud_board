import 'package:flutter/material.dart';
import 'package:stud_board/screen/home.dart';
import 'package:stud_board/screen/register.dart';
import 'package:stud_board/widget/button.dart';
import 'package:stud_board/widget/my_text_formfield.dart';

import '../widget/pass_widget.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.0),
              const Image(
                image: AssetImage("images/nfc_logo.jpg"),
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 35),
              ),
              MyTextFormField(label: 'Email', hint: 'Email'),
              MyPassField(label: 'Password', hint: 'Password'),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Register()));
                },
                child: Text(
                  'Register Instead?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7b2a23),
                  fixedSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'SIGN IN',
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
