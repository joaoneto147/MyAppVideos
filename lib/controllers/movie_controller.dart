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

  @action
  fetchMoviesRanked(){
    loadMoviesTrending().then((moviesTrending) {
      api = moviesTrending;
      if (api != null){
        api.movie.forEach((f){
          loadDetailMovie(f);
        });
      }
    });

  }

  @action
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

  @action
  Future loadDetailMovie (Movie movie) async {
    final movieId = movie.id;    
    final response = await http.get(getURL(URL_MOVIE + "$movieId", ["api_key=" + MOVIE_DB_API_KEY, "language=pt-BR", "append_to_response=credits"]));
    var json = jsonDecode(response.body);
    api.getDetailsFromJson(json, movie);
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