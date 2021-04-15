import 'package:crud/data/models/movie.dart';

abstract class WebApi {
  Future<List<Movie>> fetchMovies(String keyword);
}
