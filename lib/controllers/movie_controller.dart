import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/commons/api_movie.dart';
import 'package:http/http.dart' as http;
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  @observable
  MovieApi api;

  MovieApi tempApi;

  @action
  fetchMoviesRanked() async {
    tempApi = await loadMoviesTrending();
    await loadDetailMovie();

    api = tempApi;
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
  Future<MovieApi> loadDetailMovie() async {
    for (var i = 0; i < tempApi.movie.length; i++) {
      final movieId = tempApi.movie[i].id;    
      final response = await http.get(getURL(URL_MOVIE + "$movieId", ["api_key=" + MOVIE_DB_API_KEY, "language=pt-BR", "append_to_response=credits"]));
      var json = jsonDecode(response.body);
      tempApi.movie[i].fillMovieDetail(json);
    }

    return tempApi;
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