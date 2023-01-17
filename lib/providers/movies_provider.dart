import 'package:flutter/material.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apikey = 'aca088ed0cd6da276a7e1d954151b30c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
