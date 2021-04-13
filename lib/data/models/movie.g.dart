// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'] as String,
    poster: json['poster'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'poster': instance.poster,
    };
