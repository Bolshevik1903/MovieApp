import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app2/data/user.dart';
import 'movie.dart';

class HttpHelper {
  
  final String urlApiKey = 'api_key=3cae426b920b29ed2fb1c0749f258325';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlPopular = '/popular?';
  final String urlTopRated = '/top_rated?';
  final String urlUser = 'https://plain-marbled-muskox.glitch.me/users';

  Future<User> createUser(String username, String passsword) async {
    http.Response result = await http.post(Uri.parse(urlUser), 
      headers: <String, String> {'Content-Type' : 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': passsword
      })
    );
    if(result.statusCode == 201) {
      return User.fromJson(jsonDecode(result.body));
    } else {
      throw Exception("Faile to create User");
    }
  }

  Future<List<Movie>?> getPopular() async{
    final String url = urlBase+urlPopular+urlApiKey;
    http.Response result =  await http.get(Uri.parse(url));

    if (result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final List maps = jsonResponse['results'];
      List<Movie> movies = maps.map((map) => Movie.fromJson(map)).toList();
      return movies;
    } else {
      return null;
    }
  }
}