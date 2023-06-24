import 'package:flutter/material.dart';

class Student {
  final String name;
  bool isChecked1;
  bool isChecked2;

  Student(this.name, this.isChecked1, this.isChecked2);
}

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> students = [];
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    // Populate the list with student names
    for (int i = 1; i <= 10; i++) {
      students.add(Student('Student $i', false, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Select All'),
              Checkbox(
                value: selectAll,
                onChanged: (bool? value) {
                  setState(() {
                    selectAll = value!;
                    for (var student in students) {
                      student.isChecked1 = value;
                    }
                  });
                },
              ),
              SizedBox(width: 64)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('Present'),
              SizedBox(width: 10),
              Text('Leave'),
              SizedBox(width: 20)
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: students[index].isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            students[index].isChecked1 = value!;
                          });
                        },
                      ),
                      Checkbox(
                        value: students[index].isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            students[index].isChecked2 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
