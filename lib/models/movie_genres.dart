import 'dart:convert';
import 'package:my_app/commons/consts.dart';

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
  
  List<Genres> _getGenres(){
    Map<String, dynamic> dadosJson = json.decode(genresJson);

    List<Genres> genres = dadosJson["genres"].map<Genres>(
      (map){
        return Genres.fromJson(map);
      }
    ).toList();

    return genres;
  }
}

