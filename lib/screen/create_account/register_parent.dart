import 'package:flutter/material.dart';
import 'package:stud_board/widget/loading_icon.dart';
import 'package:stud_board/widget/text_widget.dart';
import '../../constant/constant.dart';
import '../../widget/pass_widget.dart';


class RegisterParent extends StatefulWidget {
  const RegisterParent({Key? key}) : super(key: key);

  @override
  State<RegisterParent> createState() => _RegisterParentState();
}

class _RegisterParentState extends State<RegisterParent> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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
                  const Image(
                    image: AssetImage("images/nfc_logo.jpg"),
                  ),
                  const Text(
                    'Enter Parent Info',
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
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return LoadingIcon(label: "Creating...");
                            });
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
                      'Register',
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
