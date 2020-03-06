import 'package:mobx/mobx.dart';
import 'package:my_app/models/movie_model.dart';
part 'filme_controller.g.dart';

class FilmeController = _FilmeControllerBase with _$FilmeController;

abstract class _FilmeControllerBase with Store{

  Movie _filme;

  _FilmeControllerBase() {
    _filme = Movie();
  }

  @observable
  ObservableList<Movie> listFilme;  


  @action
  loadPosts() async {
    listFilme = ObservableList<Movie>.of(await _filme.getFilmes());
  }

  @observable
  int rating;

  @action
  setRating(int value){
    rating = value;
  }

}