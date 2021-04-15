import 'package:crud/data/models/movie.dart';
import 'package:crud/data/movie/movie_service.dart';
import 'package:crud/data/service_locator.dart';
import 'package:crud/data/web_api/web_api.dart';

class MovieServiceImp implements MovieService {
  WebApi webApi = serviceLocator<WebApi>();

  @override
  Future<List<Movie>> fetchMovies(String keyword) async {
    List<Movie> movies = await webApi.fetchMovies(keyword);
    return movies;
  }
}
