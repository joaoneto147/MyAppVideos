const MOVIE_DB_API_KEY = 'YOU_API_KEY';
const YOUTUBE_API_KEY = 'YOU_API_KEY';
const URL_BASE = 'https://api.themoviedb.org/3/';

const URL_MOVIE = URL_BASE + "movie/";

String getURL(String urlBase, List<String> paramters) {
  String _paramter = '?api_key=$MOVIE_DB_API_KEY';

  paramters.forEach((f) {
    _paramter = _paramter + "&" + f;
  });  
  return urlBase + _paramter;
}

class MovieApi {
  static String upComingMovies(int page) {
    return getURL(URL_MOVIE + "upcoming", ['language=pt-BR', 'page=$page', 'region=BR']);
  }

  static String moviesRanked(int page) {
    return getURL(URL_MOVIE + 'top_rated', ['language=pt-BR', 'page=$page', 'region=BR']);       
  }

  static String popularMovies(int page) {
    return getURL(URL_MOVIE + 'popular', ['language=pt-BR', 'page=$page', 'region=BR']);        
  }

  static String nowPlaying(int page) {
    return getURL(URL_MOVIE + 'now_playing', ['language=pt-BR', 'page=$page', 'region=BR']);        
  }

  static String movieDatails(int movieId) {
    return getURL(URL_MOVIE + '$movieId', ['language=pt-BR', 'append_to_response=credits,videos']);
  }  
}
