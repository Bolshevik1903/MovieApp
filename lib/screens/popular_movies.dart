import 'package:flutter/material.dart';

import '../data/http_helper.dart';
import '../data/movie.dart';
import 'movie_item.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  HttpHelper? httpHelper;
  List<Movie>? movies;

  initialize() async {
    movies = await httpHelper?.getPopular();
    setState(() {
      movies = movies;
    });
  }

  @override
  void initState() {
    movies = List.empty();
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies?.length,
            itemBuilder: (context, index) {
              return MovieItem(movie: movies![index]);
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            pageSnapping: true,
            itemCount: movies?.length,
            itemBuilder: (context, index) {
              return MovieItem(movie: movies![index]);
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            pageSnapping: true,
            itemCount: movies?.length,
            itemBuilder: (context, index) {
              return MovieItem(movie: movies![index]);
            },
          ),
        ),
      ],
    );
  }
}
