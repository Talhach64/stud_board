import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final label;
   Button({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: label);
  }
}
