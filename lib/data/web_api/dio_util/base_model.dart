import 'package:crud/data/web_api/dio_util/entity_factory.dart';

class BaseModel<T> {
  int code;
  String message;
  String serverMessage;
  T data;

  BaseModel({this.code, this.message, this.data});

  factory BaseModel.fromJson(json) {
    if (json['Data'] != null) {
      return BaseModel(
        code: json['Code'],
        message: json['Message'],
        data: EntityFactory.generatedObj<T>(json['Data']),
      );
    } else {
      return BaseModel(
        code: json['Code'],
        message: json['Message'],
        data: null,
      );
    }
  }
}
