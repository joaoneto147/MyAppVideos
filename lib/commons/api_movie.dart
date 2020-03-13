const MOVIE_DB_API_KEY = 'd538139cb8454e145910b135dae4a1f1';
const URL_BASE = 'https://api.themoviedb.org/3/';

const URL_MOVIE = URL_BASE + "movie/";

String getURL(String urlBase, List<String> paramters) {
  String _paramter = '?api_key=$MOVIE_DB_API_KEY';

  paramters.forEach((f) {
    _paramter = _paramter + "&" + f;
  });

  print("Realizando consulta no endpoint: " + urlBase + _paramter);
  return urlBase + _paramter;
}

class MovieApi {
  static String upComingMovies(int page) {
    return getURL(URL_MOVIE + "upcoming", ['language=pt-BR', 'page=$page', 'region=BR']);
  }

  static String moviesRanked(int page) {
    return getURL(URL_BASE + 'movie/popular', ['language=pt-BR', 'page=$page', 'region=BR']);        
  }

  static String movieDatails(int movieId) {
    return getURL(URL_MOVIE + '$movieId', ['language=pt-BR', 'append_to_response=credits']);
  }
}
