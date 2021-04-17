import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movie_search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieSearchResponse {
  @JsonKey(name: "Search")
  List<Movie> movies;

  MovieSearchResponse(this.movies);

  factory MovieSearchResponse.fromJson(Map<String, dynamic> json) => _$MovieSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSearchResponseToJson(this);
}
