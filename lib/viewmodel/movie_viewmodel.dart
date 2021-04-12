import 'package:crud/data/models/movie.dart';
import 'package:crud/data/services/movie/movie_service.dart';
import 'package:crud/data/services/service_locator.dart';
import 'package:flutter/cupertino.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieService movieService = serviceLocator<MovieService>();

  List<Movie> movies = [];

  Future<void> fetchMovies(String keyword) async {
    movies = await movieService.fetchMovies(keyword);
    notifyListeners();
  }
}
