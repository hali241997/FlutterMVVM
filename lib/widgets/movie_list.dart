import 'package:crud/data/models/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        Movie movie = movies[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.poster),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            width: 50,
            height: 100,
          ),
          title: Text(movie.title),
        );
      },
    );
  }
}
