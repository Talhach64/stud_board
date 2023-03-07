import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final label,onPressed;
   Button({Key? key, required this.label,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:  Color(0xFF7b2a23),
        fixedSize: const Size(120, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
