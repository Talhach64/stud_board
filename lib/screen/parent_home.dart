import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_board/api_models/student_models.dart';
import 'package:student_board/api_models/user_model.dart';
import 'package:student_board/screen/parent_searched.dart';
import 'package:student_board/widget/text_widget.dart';

import '../api_services/api_services.dart';
import '../constant/constant.dart';
import '../widget/list_tile.dart';
import 'login.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({Key? key}) : super(key: key);

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  UserModel? user;
  List<StudentModel> student = [];
  TextEditingController searchController = TextEditingController();
  List<String> searchType = ["name", "rollNo"];
  String selectedSearchType = 'name';

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> search() async {
    List<dynamic> data = await APIService().post(
        "students/search",
        SearchStudent(query: searchController.text, type: selectedSearchType!)
            .toJson());
    student = [];
    student = (data).map((e) => StudentModel.fromJson(e)).toList();
    setState(() {});

    setState(() {});
  }

  Future<void> fetch() async {
    var data = await APIService().getOne("get-user");
    user = UserModel.fromJson(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: user != null
                        ? Text(user!.name,
                            style: const TextStyle(
                                fontSize: 25, color: primaryColor))
                        : const CircularProgressIndicator(),
                  ),
                  MyListTile(
                    label: const Text('Home'),
                    Icon: const Icon(Icons.home),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(height: 0),
                  MyListTile(
                    label: const Text('Log Out'),
                    Icon: const Icon(Icons.logout),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                      APIService().deleteID("_id");
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('NFC IET STUDENT PORTAL'),
              backgroundColor: primaryColor,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 1)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text(
                            'Search Type',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),

                          isExpanded: true,
                          // Initial Value
                          value: selectedSearchType,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: searchType.map((var e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (var newValue) {
                            selectedSearchType = newValue!;
                            setState(
                              () {},
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: searchController,
                      // keyboardType: keyboard,
                      // validator: ,
                      decoration: InputDecoration(
                        hintText: "Name or Roll no",
                        labelText: "Name or Roll no",
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: primaryColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Enter the name of the student',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print(selectedSearchType);
                            print(searchController.text);

                            search();
                            setState(() {});
                          },
                          child: const Text("search"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            student = [];
                            setState(() {});
                          },
                          child: const Text("clear"),
                        )
                      ],
                    ),
                    ...student.map((e) => student == []
                        ? const Text(
                            "Could not find student by that Name or rollno")
                        : ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ParentSearched(id: e.id,)));
                                          }, child: const Text('See Student Attendance')),
                                          // ElevatedButton(onPressed: (){}, child: const Text('See Student Result'))
                                        ],
                                      ),
                                    );
                                  });

                            },
                            title: Text(e.name),
                            subtitle: Text(e.rollNo),
                          )),

                    // ListView.builder(
                    //   shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemCount: student.length,
                    //     itemBuilder: (ctx,i){
                    //   return  ListTile(
                    //     title: Text(student[i].name),
                    //     subtitle: Text(student[i].rollNo),
                    //   );
                    // })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
