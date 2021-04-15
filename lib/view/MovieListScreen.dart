import 'package:crud/data/service_locator.dart';
import 'package:crud/viewmodel/movie_viewmodel.dart';
import 'package:crud/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  @override
  MovieListScreenState createState() => MovieListScreenState();
}

class MovieListScreenState extends State<MovieListScreen> {
  MovieViewModel model = serviceLocator<MovieViewModel>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieViewModel>(
      create: (context) => model,
      child: Consumer<MovieViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: Text("Movies")),
          body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        model.fetchMovies(value);
                        controller.clear();
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: MovieList(model.movies),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
