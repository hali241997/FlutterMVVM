import 'package:crud/data/models/base/model_types.dart';
import 'package:crud/data/models/movie.dart';
import 'package:crud/data/models/movie_search_response.dart';

class EntityFactory {
  static T generateObjectFromJson<T>(json) {
    print('---------------T:$T');

    if (json == null) {
      return null;
    }
    print(json.toString());
    switch (T.toString()) {
      case ModelTypes.MOVIE:
        return Movie.fromJson(json) as T;
      case ModelTypes.MOVIE_SEARCH_RESPONSE:
        return MovieSearchResponse.fromJson(json) as T;
      default:
        print("Unsupported model type!!");
    }
  }
}
