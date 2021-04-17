// import 'package:crud/data/models/movie.dart';
import 'package:crud/data/models/base/base_list_model.dart';
import 'package:crud/data/models/base/base_model.dart';
import 'package:crud/data/web_api/dio_util/headers_interceptors.dart';
import 'package:crud/data/web_api/dio_util/http_error.dart';
import 'package:crud/data/web_api/dio_util/logs_interceptor.dart';
import 'package:crud/data/web_api/dio_util/response_interceptors.dart';
import 'package:dio/dio.dart';

class DioManager {
  static const String BASE_URL = "https://www.omdbapi.com/?apikey=b078243";
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  Dio dio;

  static final DioManager dioManager = DioManager.instance();

  factory DioManager() => dioManager;

  DioManager.instance() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: BASE_URL,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      dio = Dio(options);

      // dio.interceptors.add(HeadersInterceptors());
      // dio.interceptors.add(LogsInterceptor());
      // dio.interceptors.add(ResponseInterceptors());
    }
  }

  Future request<T>(
    NetMethod method,
    String path, {
    bool isLoaing,
    Map param,
    Map formData,
    Function(T) onSuccess,
    Function(HttpError) onError,
  }) async {
    try {
      Response response = await dio.request(
        path,
        queryParameters: param,
        data: formData,
        options: Options(method: NetMethodValues[method]),
      );

      if (response != null) {
        BaseModel entity = BaseModel<T>.fromJson(
            response.statusCode, response.statusMessage, response.data);
        if (entity.code == 200) {
          onSuccess(entity.data);
        } else {
          onError(
              HttpError(code: entity.code.toString(), message: entity.message));
        }
      } else {
        onError(HttpError(code: "-1", message: "Unknown error"));
      }
    } on DioError catch (e) {
      onError(HttpError.dioError(e));
    }
  }

  Future requestList<T>(
    NetMethod method,
    String path, {
    bool isLoading,
    Map param,
    Map formData,
    Function(List) onSuccess,
    Function(HttpError) onError,
  }) async {
    try {
      Response response = await dio.request(path,
          queryParameters: param,
          data: formData,
          options: Options(method: NetMethodValues[method]));
      if (response != null) {
        BaseListModel entity = BaseListModel<T>.fromJson(
            response.statusCode, response.statusMessage, response.data);
        if (entity.code == 200) {
          onSuccess(entity.data);
        } else {
          onError(
              HttpError(code: entity.code.toString(), message: entity.message));
        }
      } else {
        onError(HttpError(code: "-1", message: "Unknown error"));
      }
    } on DioError catch (error) {
      onError(HttpError.dioError(error));
    }
  }
}

enum NetMethod { GET, POST, DELETE, PUT }

const NetMethodValues = {
  NetMethod.GET: "get",
  NetMethod.POST: "post",
  NetMethod.DELETE: "delete",
  NetMethod.PUT: "put"
};
