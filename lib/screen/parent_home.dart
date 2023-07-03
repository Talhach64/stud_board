import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stud_board/api_models/student_models.dart';
import 'package:stud_board/api_models/user_model.dart';
import 'package:stud_board/widget/text_widget.dart';

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
  StudentModel? student;
  TextEditingController searchController = TextEditingController();
  List<String> searchType = ["By Name", "By RollNo"];
  String? selectedSearchType;

  @override
  void initState() {
    fetch();
    super.initState();
  }
//have to start from here get the students b name but not working through model so have to Continue from model json
  Future<void> search() async {
    var data = await APIService().post("students/search", {
      "query": "talha",
      "type": "name"
    });
    student = StudentModel.fromJson(data);
    print(student);
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
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    const Text('Enter the name of the student',style: TextStyle(fontSize: 20.0),),
                    IconButton(onPressed: (){
                      search();
                    }, icon: const Icon(Icons.search),),
                    ListView.builder(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (ctx,i){
                      return const ListTile(
                        title: Text("Talha"),
                        subtitle: Text('340'),
                      );
                    })

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
