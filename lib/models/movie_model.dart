import 'package:my_app/commons/consts.dart';

enum TypeQueryMovie {
  popularMovie,
  playNowMovie,
  cominSonMovie,
  topRated
}

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
    profilePath = json['profile_path'] != null ? URL_IMAGES + json['profile_path'] : json['profile_path'];
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
    profilePath = json['profile_path'] != null ? URL_IMAGES + json['profile_path'] : json['profile_path'];
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
  String releaseDate;
  String overview;
  String backdropPath;
  MovieDetails details;
  
  Movie({this.id, this.image, this.title, this.rating, this.releaseDate, this.overview, this.backdropPath});
    
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(    
      id : json['id'],         
      image : URL_IMAGES + json['poster_path'],
      title : json['title'],
      rating : double.parse(json['vote_average'].toString()),
      releaseDate : json['release_date'],
      overview : json['overview'],
      backdropPath : (json['backdrop_path'] != null ? URL_IMAGES + json['backdrop_path'] : '')
    );
  }
}

class MovieDetails {
  String directorName;
  String movieCountry;
  List<Genres> genres;
  List<Cast> cast;
  List<Crew> crew;
  List<TrailerMovie> trailers;

  MovieDetails({this.directorName, this.movieCountry, this.genres, this.cast, this.crew, this.trailers});

  factory MovieDetails.fromJson(Map<String, dynamic> json){
    return MovieDetails(
      movieCountry: getMovieCountry(json),
      genres: getGenres(json),
      cast: json['credits'] != null ? getCast(json['credits']) : null,
      crew: json['credits'] != null ? getCrew(json['credits']) : null,
      directorName: json['credits']['crew'] != null ? getDirectorName(json['credits']) : 'Unknown',
      trailers: json['videos'] != null ? getTrailers(json['videos']) : null
    );
  }

  static String getDirectorName(Map<String, dynamic> json){    
    String _directorName = 'Unknown';
    for(var _crew in json['crew']){
      if (_crew['job'] == 'Director'){
        _directorName = _crew['name'];
        break;
      }
    }    
    return _directorName;
  }

  static String getMovieCountry(Map<String, dynamic> json){
    return "Ajustar o pais";
  }

  static List<Genres> getGenres(Map<String, dynamic> json){
    List<Genres> _genres = new List<Genres>();    
    if (json['genres'] != null) {
      _genres = json['genres'].map<Genres>(
        (map){
          return Genres.fromJson(map);
        }
      ).toList();      
    }
    return _genres;
  }

  static List<Cast> getCast(Map<String, dynamic> json){    
    if (json['cast'] != null){
      List<Cast> _cast = json["cast"].map<Cast>(
        (map){ 
          return Cast.fromJson(map);         
        }
      ).toList();

      return _cast;
    }else{return null;}    
  }

  static List<Crew> getCrew(Map<String, dynamic> json){
    if (json['crew'] != null){
      List<Crew> _crew = json["crew"].map<Crew>(
        (map){ 
          return Crew.fromJson(map);         
        }
      ).toList();
      return _crew;
    }else return null;
  }

  static List<TrailerMovie> getTrailers(Map<String, dynamic> json){    
    if (json['results'] != null){
      List<TrailerMovie> _trailers = json["results"].map<TrailerMovie>(
        (map){ 
          return TrailerMovie.fromJson(map);         
        }
      ).toList();

      return _trailers;
    }else{return null;}    
  }
}

class TrailerMovie {
  String id;  
  String key;
  String name;
  String site;
  String type;

  TrailerMovie(
      {this.id,
      this.key,
      this.name,
      this.site,
      this.type});

  factory TrailerMovie.fromJson(Map<String, dynamic> json) {
    return TrailerMovie(    
      id : json['id'],
      key : json['key'],
      name : json['name'],
      site : json['site'],
      type : json['type']
    );    
  }
}