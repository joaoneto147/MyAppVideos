import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/commons/api_movie.dart';
import 'package:my_app/commons/cache.dart';
import 'package:my_app/models/movie_model.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  @observable
  List<Movie> movies;
  
  Cache cachedMovies = GetIt.instance<Cache>();

  @action
  executeQuery(TypeQueryMovie typeQueryMovie) {
    String _url;
    switch (typeQueryMovie) {
      case TypeQueryMovie.popularMovie: _url = MovieApi.popularMovies(1); //getPopularMovie(1);
        break;
      case TypeQueryMovie.playNowMovie: _url = MovieApi.nowPlaying(1);
        break;
      case TypeQueryMovie.cominSonMovie: _url = MovieApi.upComingMovies(1);
        break;
      case TypeQueryMovie.topRated: _url = MovieApi.moviesRanked(1);
        break;
      default:
        break;
    }
    getMovies(_url, typeQueryMovie);
  }

  @action
  getMovies(String url, TypeQueryMovie typeQueryMovie) async {
    try {
      if (cachedMovies.getCacheMovie(typeQueryMovie) != null) {
        movies = cachedMovies.getCacheMovie(typeQueryMovie);
        return;
      } else {
        List<Movie> moviesReturn;
        final response = await http.get(url);
        Map<String, dynamic> json = jsonDecode(response.body);

        if (json['results'] != null) {
          moviesReturn = new List<Movie>();
          json['results'].forEach((v) {
            moviesReturn.add(Movie.fromJson(v));
          });
        }

        for (Movie movie in moviesReturn) {
          movie.details = await _loadDetailMovie(movie.id);
        }

        cachedMovies.setCacheMovie(typeQueryMovie, moviesReturn);
        movies = moviesReturn;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }    
  }

  Future loadMoviesDetails(List<Movie> movieList) async {
    movieList.forEach((movie) async {
      movie.details = await _loadDetailMovie(movie.id);
    });
  }

  Future<MovieDetails> _loadDetailMovie(int movieId) async {
    final response = await http.get(MovieApi.movieDatails(movieId));
    var json = jsonDecode(response.body);
    return MovieDetails.fromJson(json);
  }

  Widget getImage(imageURL) {
    return Image(image: NetworkImage(imageURL));
  }

  getMovie(int index) {
    return movies[index];
  }
}
