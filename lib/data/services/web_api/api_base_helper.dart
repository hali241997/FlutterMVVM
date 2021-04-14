import 'package:dio/dio.dart';

class ApiBaseHelper {
  String baseUrl = "";
  Dio dio;

  ApiBaseHelper({this.baseUrl}) {
    BaseOptions options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 10000,
      baseUrl: this.baseUrl,
    );
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor());
  }

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');

    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      print('error: $error');
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    print('Api Post, url $url');

    try {
      final response = await dio.post(url, data: {data});
      return response.data;
    } catch (error) {
      print('error: $error');
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    print('Api Put, url $url');

    try {
      final response = await dio.put(url, data: {data});
      return response.data;
    } catch (error) {
      print('error: $error');
    }
  }

  Future<dynamic> delete(String url) async {
    print('Api Delete, url $url');

    try {
      final response = await dio.delete(url);
      return response.data;
    } catch (error) {
      print('error: $error');
    }
  }
}
