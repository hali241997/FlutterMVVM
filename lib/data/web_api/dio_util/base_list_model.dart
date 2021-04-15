import 'package:crud/data/web_api/dio_util/entity_factory.dart';

class BaseListModel<T> {
  // int code;
  // String message;
  // dynamic pageResult;
  List<T> search;

  // BaseListModel({this.code, this.message, this.data, this.pageResult});
  BaseListModel({this.search});

  factory BaseListModel.fromJson(json) {
    List<T> mSearch = [];
    if (json['Search'] != null) {
      (json['Search'] as List).forEach((element) {
        mSearch.add(EntityFactory.generatedObj<T>(element));
      });
    }

    return BaseListModel(search: mSearch);
    // if (json['Data'] != null && json['Data']['Data'] != null) {
    //   (json['Data']['Data'] as List).forEach((element) {
    //     mData.add(EntityFactory.generatedObj<T>(element));
    //   });
    // }

    // if (json['Data'] != null) {
    //   return BaseListModel(
    //     code: json['code'],
    //     message: json['Message'],
    //     data: mData,
    //     pageResult: EntityFactory.generatedObj<T>(json['Data']['PagingResult']),
    //   );
    // } else {
    //   return BaseListModel(
    //     code: json['code'],
    //     message: json['Message'],
    //     data: null,
    //   );
    // }
  }
}
