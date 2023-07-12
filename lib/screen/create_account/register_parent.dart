import 'package:flutter/material.dart';
import 'package:student_board/widget/loading_icon.dart';
import 'package:student_board/widget/text_widget.dart';
import '../../constant/constant.dart';
import '../../widget/img.dart';
import '../../widget/pass_widget.dart';

class RegisterParent extends StatefulWidget {
  const RegisterParent({Key? key}) : super(key: key);

  @override
  State<RegisterParent> createState() => _RegisterParentState();
}

class _RegisterParentState extends State<RegisterParent> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
                  const Img(),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter Parent Info',
                    style: TextStyle(fontSize: 35),
                  ),
                  MyTextFormField(
                      label: 'Full Name',
                      hint: "Full name",
                      controller: nameController,
                      validator: (String? value) =>
                          value!.isEmpty ? "This field is required" : null),
                  MyTextFormField(
                      label: 'Phone No',
                      hint: "Phone No",
                      controller: phoneController,
                      validator: (String? value) =>
                      value!.isEmpty ? "This field is required" : null),
                  MyTextFormField(
                      label: 'Email',
                      hint: 'Email',
                      controller: emailController,
                      validator: (String? value) =>
                          value!.isEmpty ? "Invalid Email" : null),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
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
