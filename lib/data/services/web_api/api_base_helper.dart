import 'dart:convert';
import 'dart:io';
import 'package:crud/data/services/web_api/api_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  String baseUrl = "";

  ApiBaseHelper({this.baseUrl});

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');

    var responseJson;

    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');

    var responseJson;

    try {
      final response = await http.post(Uri.parse(baseUrl + url), body: body);
      responseJson = returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');

    var responseJson;

    try {
      final response = await http.put(Uri.parse(baseUrl + url), body: body);
      responseJson = returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api Delete, url $url');

    var responseJson;

    try {
      final response = await http.delete(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
