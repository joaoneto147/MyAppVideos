import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_app/commons/api_keys.dart';

class Movie{
  int id;
  String image;
  String title;
  double rating;  
  String directorName;
  String movieCountry;

  Movie({this.id, this.image, this.title, this.rating, this.directorName, this.movieCountry});
    
  Movie.fromJson(Map<String, dynamic> json) {
      id = json['id'];            
      image = json['poster_path'];
      title = json['title'];      
      rating = json['vote_average'];  
      directorName = "";
      movieCountry = "";
  }

  //Return trending movies week
  Future<List<Movie>> getTrendingMovies() async {
    try {      
      http.Response response = await http.get(
        URL_BASE + "3/trending/movie/week" + 
        "?api_key=" + MOVIE_DB_API_KEY
      );

      if (response.statusCode == 200){
        Map<String, dynamic> dadosJson = json.decode(response.body);
        
        
        List<Movie> listMovies = dadosJson["results"].map<Movie>(
          (map){ 
            return Movie.fromJson(map);         
          }
        ).toList();   

        return listMovies;     
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}

List<Movie> movies = [
  Movie(
    id: 1,
    image: "images/dragonheart_vengeance.jpg",
    title: "Dragonheart: Vengeance",
    rating: 6,
    directorName: "Ivan Silvestrini",
    movieCountry: "United States"
  ),
  Movie(
    id: 2,
    image: "images/sonic.jpg",
    title: "Sonic: O Filme",
    rating: 7.2,
    directorName: "Jeff Fowler",
    movieCountry: "United States"
  ),
  Movie(
    id: 3,
    image: "images/aves_de_rapina.jpg",
    title: "Aves de Rapina",
    rating: 6,
    directorName: "Cathy Yan",
    movieCountry: "United States"
  ),
  Movie(
    id: 4,
    image: "images/o_homem_invisivel.jpg",
    title: "O Homem Invisível",
    rating: 7.5,
    directorName: "Leigh Whannell",
    movieCountry: "United States"
  ),    
  Movie(
    id: 5,
    image: "images/chamado_da_floresta.jpg",
    title: "O Chamado da Floresta",
    rating: 5.9,
    directorName: "Chris Sanders",
    movieCountry: "United States"
  )                      
];