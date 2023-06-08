import 'package:flutter/material.dart';
import 'package:movie_app2/screens/movie_list.dart';

import '../data/http_helper.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xtreme Movie App")),
      body: Column(
        children: [
          Expanded(
            child: MovieList(url: MovieUrl.popular.url),
          ),
          Expanded(
            child: MovieList(url: MovieUrl.upcoming.url),
          ),
          Expanded(
            child: MovieList(url: MovieUrl.topRated.url),
          ),
        ],
      ),
    );
  }
}