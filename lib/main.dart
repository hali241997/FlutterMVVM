import 'package:crud/data/service_locator.dart';
import 'package:crud/view/MovieListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: MovieListScreen(),
    );
  }
}
