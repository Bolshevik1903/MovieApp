import 'package:flutter/material.dart';
import '../data/movie.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.movie.title),
          Expanded(
            child: Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie.posterUrl}'),
          ),
        ],
      ),
    );
  }
}
