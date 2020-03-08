import 'package:my_app/models/movie_model.dart';

const MOVIE_DB_API_KEY = '';
const URL_BASE = 'https://api.themoviedb.org/3/';
const URL_IMAGES = 'https://image.tmdb.org/t/p/w500/';

const URL_TRENDING = URL_BASE + "trending/movie/week" + "?api_key=" + MOVIE_DB_API_KEY + "&language=pt-BR" + "&include_image_language=en,pt,null";
const URL_POPULAR_MOVIE = URL_BASE + "movie/popular" + "?api_key=" + MOVIE_DB_API_KEY + "&language=pt-BR" + "&page=1" + "&region=BR";
const URL_MOVIE = URL_BASE + "";



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
}

