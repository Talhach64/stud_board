import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MyPassField extends StatefulWidget {
  final label, hint;
  TextEditingController controller;
  TextInputType keyboard;


  MyPassField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.keyboard})
      : super(key: key);

  @override
  State<MyPassField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyPassField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: obscure,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        keyboardType: widget.keyboard,
        //  validator: validator,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: primaryColor),
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: GestureDetector(
            onTap: () => setState(() => obscure = !obscure),
            child: obscure
                ? const Icon(
                    Icons.visibility_off,
                    color: primaryColor,
                  )
                : const Icon(Icons.visibility, color: primaryColor),
          ),
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
