import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/views/ranking.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  int pageIndex;

  @action 
  Widget getCurrentPage(){
    return Ranking();
  }
}