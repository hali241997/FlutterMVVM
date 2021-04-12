import 'dart:convert';
import 'package:crud/data/models/movie.dart';
import 'package:crud/data/services/web_api/web_api.dart';
import 'package:http/http.dart' as http;

class WebApiImpl implements WebApi {
  List<Movie> movies;

  @override
  Future<List<Movie>> fetchMovies(String keyword) async {
    if (movies == null) {
      print('Getting movies from the web');
      final url = "https://www.omdbapi.com/?s=$keyword&apikey=b078243";
      final uri = Uri.parse(url);
      final results = await http.get(uri);
      final jsonObject = json.decode(results.body);
      movies = createRateListFromRawMap(jsonObject);
      return movies;
    } else {
      print('getting rates from cache');
      return [];
    }
  }

  List<Movie> createRateListFromRawMap(Map jsonObject) {
    final Iterable json = jsonObject['Search'];
    return json.map((movie) => Movie.fromJson(movie)).toList();
  }
}
