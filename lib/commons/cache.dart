import 'package:my_app/models/movie_model.dart';

class Cache{
  List<Movie> popularMovie;
  List<Movie> playNow;
  List<Movie> upComingMovies;
  List<Movie> rankedMovies;

  getCacheMovie(TypeQueryMovie typeQueryMovie){
    switch (typeQueryMovie) {
      case TypeQueryMovie.popularMovie: return popularMovie;
      case TypeQueryMovie.playNowMovie: return playNow;
      case TypeQueryMovie.cominSonMovie: return upComingMovies;
      case TypeQueryMovie.topRated: return rankedMovies;
    }
  }

  setCacheMovie(TypeQueryMovie typeQueryMovie, List<Movie> movies){
    switch (typeQueryMovie) {
      case TypeQueryMovie.popularMovie: popularMovie = movies; 
        break;
      case TypeQueryMovie.playNowMovie: playNow = movies;
        break;
      case TypeQueryMovie.cominSonMovie: upComingMovies = movies;
        break;
      case TypeQueryMovie.topRated: rankedMovies = movies;
        break;
    }
  }
}