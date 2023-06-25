import 'package:flutter/material.dart';
import 'package:stud_board/constant/constant.dart';

class MyListTile extends StatelessWidget {
  final Widget Icon;
  final Text label;
  final  onTap;

   const MyListTile({Key? key,required this.label,required this.Icon,this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon,
      title: label,
      selectedColor: primaryColor,
    );
  }
}
