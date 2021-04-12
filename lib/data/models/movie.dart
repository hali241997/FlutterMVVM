class Movie {
  final String title;
  final String poster;

  String getTitle() {
    return this.title;
  }

  String getPoster() {
    return this.poster;
  }

  Movie({this.title, this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(title: json["Title"], poster: json["Poster"]);
  }
}
