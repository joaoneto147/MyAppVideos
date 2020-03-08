import 'package:my_app/commons/api_movie.dart';

class Movie{
  int id;
  String image;
  String title;
  var rating;  
  String directorName;
  String movieCountry;
  String releaseDate;
  
  Movie({this.id, this.image, this.title, this.rating, this.directorName, this.movieCountry, this.releaseDate});
    
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];            
    image = URL_IMAGES + json['poster_path'];
    title = json['title'];      
    rating = json['vote_average'];       
    directorName = "João Neto";
    movieCountry = "United States";
    releaseDate = json['release_date'];
  }

  Movie.getDetails(Map<String, dynamic> detailsJson) {
    directorName = "João Neto";
    movieCountry = "Brasil";
  }
}