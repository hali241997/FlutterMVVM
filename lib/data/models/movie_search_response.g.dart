// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchResponse _$MovieSearchResponseFromJson(Map<String, dynamic> json) {
  return MovieSearchResponse(
    (json['Search'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieSearchResponseToJson(
        MovieSearchResponse instance) =>
    <String, dynamic>{
      'Search': instance.movies?.map((e) => e?.toJson())?.toList(),
    };
