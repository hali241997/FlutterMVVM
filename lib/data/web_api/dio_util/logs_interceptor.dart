import 'package:crud/data/web_api/dio_util/http_error.dart';
import 'package:dio/dio.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('-------------------------Request exception information: ' +
        HttpError(code: err.type.toString(), message: err.message).toString());
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "-------------------------Request API: ${options.baseUrl}${options.path}");
    print('Request header: ' + options.headers.toString());
    if (options.data != null) {
      print('-------------------------Request parameters: ' +
          options.data.toString());
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}
