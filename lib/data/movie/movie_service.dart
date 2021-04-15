import 'package:crud/data/models/movie.dart';

abstract class MovieService {
  Future<List<Movie>> fetchMovies(String keyword);
}
