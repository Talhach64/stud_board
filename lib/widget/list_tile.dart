import 'package:flutter/material.dart';
import 'package:stud_board/constant/constant.dart';

class MyListTile extends StatelessWidget {
  final Widget Icon;
  final Text label;
  final  onTap;
  final  selected;

   const MyListTile({Key? key,required this.label,required this.Icon,this.onTap,this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon,
      title: label,
      selected: selected,
      selectedColor: primaryColor,
    );
  }
}
