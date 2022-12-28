import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final label,hint;
  MyTextFormField({Key? key, required this.label,required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: TextFormField(
            //autovalidateMode: AutovalidateMode.onUserInteraction,
           // controller: controller,
           // keyboardType: keyboard,
          //  validator: validator,
            decoration: InputDecoration(
                focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF7b2a23))),
                hintText: hint,
                // hintStyle: TextStyle(color: primaryColor),
                labelText: label,
                labelStyle: TextStyle(color: Color(0xFF7b2a23)),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
          ),
        );
  }
}
