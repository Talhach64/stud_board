import 'package:flutter/material.dart';

class DepartmentDropDown extends StatefulWidget {
  DepartmentDropDown({Key? key,}) : super(key: key);

  @override
  State<DepartmentDropDown> createState() => _DepartmentDropDownState();
}

class _DepartmentDropDownState extends State<DepartmentDropDown> {
  String? dropdownvalue ;
  var items = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(

      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
