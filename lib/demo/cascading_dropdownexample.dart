// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
//
// class Country {
//   final int id;
//   final String name;
//
//   Country({required this.id, required this.name});
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
//
// class ApiService {
//   final Dio dio = Dio();
//
//   Future<List<Country>> getCountries() async {
//     final response = await dio.get('https://example.com/countries');
//     final List<dynamic> responseData = response.data;
//     return responseData.map((json) => Country.fromJson(json)).toList();
//   }
//
//   Future<List<String>> getCities(int countryId) async {
//     final response = await dio.get('https://example.com/cities?country_id=$countryId');
//     final List<dynamic> responseData = response.data;
//     return responseData.map((json) => json['name'] as String).toList();
//   }
// }
//
//
// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   final ApiService apiService = ApiService();
//
//   List<Country> _countries = [];
//   List<String> _cities = [];
//
//   int? _selectedCountryId;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchCountries();
//   }
//
//   Future<void> _fetchCountries() async {
//     final List<Country> countries = await apiService.getCountries();
//     setState(() {
//       _countries = countries;
//     });
//   }
//
//   Future<void> _fetchCities(int countryId) async {
//     final List<String> cities = await apiService.getCities(countryId);
//     setState(() {
//       _cities = cities;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButtonFormField<Country>(
//           value: _selectedCountryId != null
//               ? _countries.firstWhere((c) => c.id == _selectedCountryId)
//               : null,
//           items: _countries
//               .map((c) => DropdownMenuItem<Country>(
//             value: c,
//             child: Text(c.name),
//           ))
//               .toList(),
//           onChanged: (selectedCountry) {
//             setState(() {
//               _selectedCountryId = selectedCountry?.id;
//               _fetchCities(_selectedCountryId!);
//             });
//           },
//           decoration: InputDecoration(
//             labelText: 'Country',
//           ),
//         ),
//         DropdownButtonFormField<String>(
//           value: _cities.isNotEmpty ? _cities[0] : null,
//           items: _cities
//               .map((c) => DropdownMenuItem<String>(
//             value: c,
//             child: Text(c),
//           ))
//               .toList(),
//           onChanged: _cities.isEmpty
//               ? null
//               : (selectedCity) {
//             setState(() {
//               _cities = [_cities.remove(selectedCity!), selectedCity!];
//             });
//           },
//           decoration: InputDecoration(
//             labelText: 'City',
//           ),
//         ),
//       ],
//     );
//   }
// }
//
