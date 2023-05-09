import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../api_models/departments_model.dart';

class APIService {
  final Dio _dio = Dio();
  final apiUrl = "https://nfc-master-api.onrender.com/api" ;

  Future<void> setToken(String token) async {
    final box = await Hive.openBox('auth');
    await box.put('token', token);
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox('auth');
    final token = box.get('token');
    return token;
  }

  Future<void> setPersonID(String id) async {
    final box = await Hive.openBox('auth');
    await box.put('_id', id);
  }

  Future<String?> getPersonID() async {
    final box = await Hive.openBox('auth');
    final id = box.get('_id');
    return id;
  }

  Future<void> deleteID(String id) async {
    final box = await Hive.openBox('auth');
    await box.delete(id);
  }

  Future<List<dynamic>?> getAll(String route) async {
    try {
      final response = await _dio.get(
        "$apiUrl/$route",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          List<dynamic> data = response.data;
          return data;
        case 401:
          throw Exception('Unauthorized');
        case 404:
          throw Exception('Not found');
        case 500:
          throw Exception('Internal server error');
        default:
          throw Exception('An unexpected error occurred');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<dynamic>?> getAllDPSS() async {
    try {
      final response = await _dio.get(
        "https://nfc-master-api.onrender.com/api/programs?department=63ff0d33f4bceba698b531f1",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          List<dynamic> data = response.data;
          return data;
        case 401:
          throw Exception('Unauthorized');
        case 404:
          throw Exception('Not found');
        case 500:
          throw Exception('Internal server error');
        default:
          throw Exception('An unexpected error occurred');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<dynamic>? getOne(String route) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/$route",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          return response.data;
        case 401:
          throw Exception('Unauthorized');
        case 404:
          throw Exception('Not found');
        case 500:
          throw Exception('Internal server error');
        default:
          throw Exception('An unexpected error occurred');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<dynamic> post(route,Map<String, dynamic> data) async {
    Response res = await _dio.post(
      "$apiUrl/$route",
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );
    switch (res.statusCode) {
      case 202:
        return res.data['token'];
      case 401:
        throw Exception('Unauthorized');
      case 404:
        throw Exception('Not found');
      case 500:
        throw Exception('Internal server error');
      default:
        throw Exception('An unexpected error occurred');
    }
  }

  Future<void> put(String route, Map<String, dynamic> data) async {
    try {
      await _dio.put(
        "$apiUrl/$route",
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> delete(String route) async {
    try {
      await _dio.delete(
        "$apiUrl/$route",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }
}
