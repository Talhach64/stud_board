import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5.0),
            const Image(
              image: AssetImage("images/nfc_logo.jpg"),
            ),
            const Text(
              'Register As',
              style: TextStyle(fontSize: 35),
            ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: GestureDetector(
             // onTap: onTap,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF7b2a23),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'STUDENT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        ),),),
              ),
            ),
          ),
            SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: GestureDetector(
             // onTap: onTap,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF7b2a23),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'PARENT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        ),),),
              ),
            ),
          ),
            SizedBox(height: 15),


            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()));
              },
              child: Text(
                'Sign In Instead?',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
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
    );
  }
}