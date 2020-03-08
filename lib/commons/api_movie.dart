import 'package:my_app/models/movie_model.dart';

const MOVIE_DB_API_KEY = 'd538139cb8454e145910b135dae4a1f1';
const URL_BASE = 'https://api.themoviedb.org/3/';
const URL_IMAGES = 'https://image.tmdb.org/t/p/w500/';

const URL_TRENDING = URL_BASE + "trending/movie/week" + "?api_key=" + MOVIE_DB_API_KEY + "&language=pt-BR" + "&include_image_language=en,pt,null";
const URL_POPULAR_MOVIE = URL_BASE + "movie/popular" + "?api_key=" + MOVIE_DB_API_KEY + "&language=pt-BR" + "&page=1" + "&region=BR";
const URL_MOVIE = URL_BASE + "movie/";

String getURL(String urlBase, List<String> paramters){
  bool firstParamter = true;
  String _paramter = "";
  
  paramters.forEach((f){
    _paramter = _paramter + (firstParamter ? "?" : "&") + f;
    firstParamter = false;
  });

  print("Realizando consulta no endpoint: " + urlBase + _paramter);
  return urlBase + _paramter;
}


class MovieApi {
  List<Movie> movie;

  MovieApi({this.movie});

  MovieApi.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movie = new List<Movie>();
      json['results'].forEach((v) {
        movie.add(new Movie.fromJson(v));
      });
    }  
  }


  getDetailsFromJson(Map<String, dynamic> json, Movie movie){
    movie.fillMovieDetail(json);
  }  
}

