// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
//
//
// class AppData {
//   static late SharedPreferences _preferences;
//
//   static Future<void> initialize() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static const _accessToken = 'AccessToken';
//
//   Future<void> setAccessToken(String token) async {
//     await _preferences.setString(_accessToken, token);
//   }
//
//   String getAccessToken() {
//     return _preferences.getString(_accessToken) ?? '';
//   }
// }
// class APIServices {
//   final apiUrl ='https://nfc-master-api.onrender.com/api';
//
//   Future<Map<String,String>> getHeaders () async {
//     String? token = await getAccessToken();
//     return <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer ${token ?? ''}'
//     };
//   }
//
//   Future<String?> getAccessToken () async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     return preferences.getString('access_token');
//   }
//
//   Future setAccessToken (String token) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.setString('access_token',token);
//   }
//
//   Future setPersonID (String id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.setString('_id',id);
//   }
//
//   Future<String?> getPersonID () async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     return preferences.getString('_id');
//   }
//
//   Future<List<dynamic>> getAll(String route) async {
//     String? accessToken = await getAccessToken();
//     print("$apiUrl/$route");
//     final response = await http.get(Uri.parse('$apiUrl/$route'), headers: {
//       'Authorization': 'Bearer ${accessToken ?? ''}'
//     });
//
//     switch (response.statusCode) {
//       case 200:
//         List<dynamic> decodedData = jsonDecode(response.body);
//         return decodedData;
//       default:
//         throw Exception(jsonDecode(response.body));
//     }
//   }
//
//   Future<dynamic> getOne(BuildContext context,String route) async {
//     String? accessToken = await getAccessToken();
//     final response = await http.get(Uri.parse('$apiUrl/$route'), headers: {
//       'Authorization': 'Bearer ${accessToken ?? ''}'
//     });
//
//     switch (response.statusCode) {
//       case 200:
//         var res = jsonDecode(response.body);
//         return res;
//       default:
//         throw Exception();
//     }
//   }
//
//   Future<dynamic> post(BuildContext context,String route, Map<String,dynamic> data) async {
//     Map<String,String> headers = await getHeaders();
//     Response res = await http.post(Uri.parse("$apiUrl/$route"),
//         body: jsonEncode(data),
//         headers: headers
//     );
//     var decodedData = jsonDecode(res.body);
//     return decodedData;
//     // switch (res.statusCode) {
//     //   case 201:
//     //     return decodedData;
//     //   default:
//     //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(decodedData['message'])));
//     //     throw Exception(res.body);
//     // }
//   }
//
//   Future<dynamic> specialPostCase(BuildContext context,String route, Map<String,dynamic> data) async {
//     Map<String,String> headers = await getHeaders();
//     Response res = await http.post(Uri.parse("$apiUrl/$route"),
//         body: jsonEncode(data),
//         headers: headers
//     );
//
//   }
//
//   Future delete(BuildContext context,String route) async {
//     Map<String,String> headers = await getHeaders();
//     Response res = await http.delete(Uri.parse("$apiUrl/$route"),
//         headers: headers
//     );
//     switch (res.statusCode) {
//       case 200:
//         return null;
//       default:
//         throw Exception(res.body);
//     }
//   }
//
//   Future patch(BuildContext context,String route, Map<String,dynamic> data) async {
//
//     Map<String,String> headers = await getHeaders();
//     Response res = await http.patch(Uri.parse("$apiUrl/$route"),
//         body: jsonEncode(data),
//         headers: headers
//     );
//     print(res.statusCode);
//     var decodedData = jsonDecode(res.body);
//     switch (res.statusCode) {
//       case 200:
//         return decodedData;
//       default:
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(decodedData['message'])));
//         throw Exception(decodedData);
//     }
//   }
//
// }
