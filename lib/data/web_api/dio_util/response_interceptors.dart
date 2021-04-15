import 'package:dio/dio.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = response.requestOptions;
    String body = response.data.toString();
    print('-------------------------${options.contentType}');

    try {
      if (options.contentType != null && options.contentType == "text") {
        print("-------------------------HTTP_RESPONSE_BODY::${response.data}");
      }
      if (response.statusCode == 200) {
        if (body.length > 600) {
          for (int i = 0; i < body.toString().length; i += 600) {
            if (i + 600 < body.toString().length) {
              print(
                  "-------------------------HTTP_RESPONSE_BODY::${body.toString().substring(i, i + 600)}");
            } else {
              print(
                  "-------------------------HTTP_RESPONSE_BODY::${body.toString().substring(i, body.toString().length)}");
            }
          }
        } else {
          print('-------------------------HTTP_RESPONSE_BODY::$body');
        }
      }
    } catch (e) {
      print('-------------------------ERROR::$body');
    }

    super.onResponse(response, handler);
  }
}
