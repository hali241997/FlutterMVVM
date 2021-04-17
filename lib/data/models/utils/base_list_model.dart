import 'package:crud/data/models/utils/model_factory.dart';

class BaseListModel<T> {
  int code;
  String message;
  List<T> data;

  BaseListModel({this.code, this.message, this.data});

  factory BaseListModel.fromJson(code, message, json) {
    List<T> mData = List.empty();
    if (json != null) {
      (json as List).forEach((element) {
        mData.add(EntityFactory.generateObjectFromJson(json)<T>(element));
      });
    }

    if (json != null) {
      return BaseListModel(
        code: code,
        message: message,
        data: mData,
      );
    } else {
      return BaseListModel(
        code: code,
        message: message,
        data: null,
      );
    }
  }
}
