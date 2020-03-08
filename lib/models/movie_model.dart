import 'dart:convert';

import 'package:my_app/commons/api_movie.dart';
import 'package:http/http.dart' as http;

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
} 

class Cast {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  Cast.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Crew {
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    department = json['department'];
    gender = json['gender'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Movie{
  int id;
  String image;
  String title;
  var rating;  
  String directorName;
  String movieCountry;
  String releaseDate;
  List<Genres> genres;
  List<Cast> cast;
  List<Crew> crew;
  
  Movie({this.id, this.image, this.title, this.rating, this.directorName, this.movieCountry, this.releaseDate});
    
  Movie.fromJson(Map<String, dynamic> json){
    id = json['id'];            
    image = URL_IMAGES + json['poster_path'];
    title = json['title'];      
    rating = json['vote_average'];       
    releaseDate = json['release_date'];    
    movieCountry = "United States";
    directorName = "";
  }

  fillMovieDetail(Map<String, dynamic> json){
    //TO-DO refactor to list in future
    if (json['genres'] != null) {
      this.genres = new List<Genres>();
      json['genres'].forEach((v) {
        this.genres.add(new Genres.fromJson(v));
      });

      this.genres = genres;
    }
    // Get team
    if (json['credits'] != null) {
      //Get cast
      if (json['credits']['cast'] != null){
        this.cast = new List<Cast>();
        
        json['credits']['cast'].forEach((v) {
          this.cast.add(new Cast.fromJson(v));
        });        
      }

      //Get crew
      if (json['credits']['crew'] != null) {
        this.crew = new List<Crew>();
        json['credits']['crew'].forEach((v) {
          this.crew.add(new Crew.fromJson(v));
        });

        this.directorName = (crew.firstWhere((c) => c.job == "Director", orElse: () => null) != null) 
          ? crew.firstWhere((c) => c.job == "Director", orElse: () => null).name
        : "Unknown"; 
      }
    }
  }
}