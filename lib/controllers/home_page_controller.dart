import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/views/movie_feed.dart';
import 'package:my_app/views/movies.dart';
import 'package:my_app/views/ranking.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  int pageIndex;

  @action 
  Widget getCurrentPage(int index){
    switch (index) {
      case 0: return MoviesView();
      break;
      case 1: return Ranking();
      break;
      case 2: return FeedMovie();
      default: return Ranking();
    }
        
  }
}