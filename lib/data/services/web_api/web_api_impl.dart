import 'package:crud/data/models/movie.dart';
import 'package:crud/data/services/web_api/api_base_helper.dart';
import 'package:crud/data/services/web_api/web_api.dart';

class WebApiImpl implements WebApi {
  @override
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  List<Movie> movies;

  @override
  Future<List<Movie>> fetchMovies(String keyword) async {
    if (movies == null) {
      print('Getting movies from the web');
      apiBaseHelper.baseUrl =
          "https://www.omdbapi.com/?s=$keyword&apikey=b078243";
      final jsonObject = await apiBaseHelper.get("");
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
