import 'package:crud/data/models/movie.dart';
import 'package:crud/data/services/web_api/api_base_helper.dart';

abstract class WebApi {
  ApiBaseHelper apiBaseHelper;

  Future<List<Movie>> fetchMovies(String keyword);
}
