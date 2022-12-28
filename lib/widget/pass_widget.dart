import 'package:flutter/material.dart';

class MyPassField extends StatefulWidget {
  final label, hint;

  MyPassField({Key? key, required this.label, required this.hint})
      : super(key: key);

  @override
  State<MyPassField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyPassField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: true,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        // controller: controller,
        // keyboardType: keyboard,
        //  validator: validator,
        decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF7b2a23))),
            labelStyle: TextStyle(color: Color(0xFF7b2a23)),
            hintText: widget.hint,
            labelText: widget.label,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                    print(obscure);
                  });
                },
                child: obscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}
