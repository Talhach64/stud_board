import 'package:flutter/material.dart';
import 'package:stud_board/screen/home.dart';
import 'package:stud_board/screen/register.dart';
import 'package:stud_board/widget/button.dart';
import 'package:stud_board/widget/text_widget.dart';

import '../constant/constant.dart';
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
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5.0),
                const Image(
                  image: AssetImage("images/nfc_logo.jpg"),
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 35),
                ),
                const MyTextFormField(label: 'Email', hint: 'Email'),
                MyPassField(label: 'Password', hint: 'Password'),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text(
                    'Register Instead?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  primaryColor,
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
      ),
    );
  }
}
