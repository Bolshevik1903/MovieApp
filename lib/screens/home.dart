import 'package:flutter/material.dart';
import 'package:movie_app2/screens/login.dart';
import 'package:movie_app2/screens/popular_movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XtremeMovie'),
      ),
      body: const Login(),
    );
  }
}
