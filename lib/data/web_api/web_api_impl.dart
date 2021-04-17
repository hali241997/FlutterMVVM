import 'package:crud/data/models/movie.dart';
import 'package:crud/data/models/movie_search_response.dart';
import 'package:crud/data/web_api/dio_util/dio_manager.dart';
import 'package:crud/data/web_api/web_api.dart';

class WebApiImpl implements WebApi {
  List<Movie> movies;

  @override
  Future<List<Movie>> fetchMovies(String keyword) async {
    await DioManager().request<MovieSearchResponse>(
      NetMethod.GET,
      "https://www.omdbapi.com/?apikey=b078243&s=$keyword",
      onSuccess: (response) {
        print(response.toJson());
        movies = response.movies;
      },
      onError: (error) {
        print('------------error:$error');
      },
    );

    return movies;
  }
}
