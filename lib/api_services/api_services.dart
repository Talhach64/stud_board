import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class APIService {
  final Dio _dio = Dio();

  Future<String> _getToken() async {
    final box = await Hive.openBox('auth');
    final token = box.get('token');
    return token;
  }

  Future<void> setToken(String token) async {
    final box = await Hive.openBox('auth');
    await box.put('token', token);
  }

  Future<List<dynamic>?> getAll(String route) async {
    try {
      final response = await _dio.get(
        route,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _getToken()}',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          List<dynamic> decodedData = jsonDecode(response.data);
          return decodedData;
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
        route,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _getToken()}',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.data);
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

  Future<void> post(String route, Map<String, dynamic> data) async {
    try {
      await _dio.post(
        route,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _getToken()}',
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> put(String route, Map<String, dynamic> data) async {
    try {
      await _dio.put(
        route,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _getToken()}',
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
        route,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _getToken()}',
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }
}
