import 'package:crud/data/models/movie.dart';

class EntityFactory {
  static T generatedObj<T>(json) {
    print('---------------T:$T');
    if (json == null) {
      return null;
    } else if (T.toString() == 'Movie') {
      return Movie.fromJson(json) as T;
    } else {
      return json as T;
    }
  }
}
