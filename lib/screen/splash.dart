import 'package:flutter/material.dart';
import 'package:student_board/screen/login.dart';

import 'student_screens/student_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
        (
        child:ElevatedButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Login()));
        }, child: const Text('Get Started')),
      )
      ,

    );
  }
}
