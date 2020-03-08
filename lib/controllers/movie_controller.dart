import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/commons/api_movie.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/movie_model.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  @observable
  MovieApi api;

  @observable
  int teste;

  @action
  fetchMoviesRanked(){
    loadMoviesTrending().then((moviesTrending) {
      api = null;
      api = moviesTrending;
      teste = 123;
    });
  }

  Future<MovieApi> loadMoviesTrending () async{
    try {      
      final response = await http.get(URL_POPULAR_MOVIE);
      var json = jsonDecode(response.body);
      return MovieApi.fromJson(json);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  getMoviesDetails (List<Movie> movies){
    
    void _getMoviesDetails (Movie mv) async {
      http.Response response = await http.get(
        URL_BASE        
      );
      if (response.statusCode == 200){
        Map<String, dynamic> dadosJson = json.decode(response.body);       
      }
    }

    movies.forEach((movie) => _getMoviesDetails(movie));
  }  

  Widget getImage(imageURL){
    return Image(
      image: NetworkImage(imageURL)
    );
  }

  getMovie(int index){
    return api.movie[index];  
  }

} 