import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/commons/api_movie.dart';
import 'package:my_app/models/movie_model.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
   
  @observable
  List<Movie> movies;  

  @action
  getMoviesRanked(int page) async {    
    try {
      List<Movie> moviesReturn;
      final response = await http.get(MovieApi.moviesRanked(page));
      Map<String, dynamic> json = jsonDecode(response.body);

      if (json['results'] != null) {
        moviesReturn = new List<Movie>();
        json['results'].forEach((v) {
          moviesReturn.add(Movie.fromJson(v));
        });
      }

      for (Movie movie in moviesReturn){
        movie.details = await _loadDetailMovie(movie.id);
      }

      // await moviesReturn.forEach((movie) async {
        // movie.details = await _loadDetailMovie(movie.id);
      // });

      movies = moviesReturn;
      // movies = await  loadMoviesDetails(moviesReturn);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");    
    }
  }

  getMoviesUpComing() async {

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

  Widget getImage(imageURL){
    return Image(
      image: NetworkImage(imageURL)
    );
  }

  getMovie(int index){
    return movies[index];  
  }

} 