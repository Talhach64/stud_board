import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MyTextFormField extends StatelessWidget {
  final label, hint;

  const MyTextFormField({Key? key, required this.label, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        // controller: controller,
        // keyboardType: keyboard,
        //  validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(color: primaryColor),

          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
