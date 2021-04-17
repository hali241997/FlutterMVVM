import 'package:crud/data/models/base/model_factory.dart';

class BaseModel<T> {
  int code;
  String message;
  String serverMessage;
  T data;

  BaseModel({this.code, this.message, this.data});

  factory BaseModel.fromJson(code, message, json) {
    if (json != null) {
      return BaseModel(
        code: code,
        message: message,
        data: EntityFactory.generateObjectFromJson<T>(json),
      );
    } else {
      return BaseModel(
        code: code,
        message: message,
        data: null,
      );
    }
  }
}
