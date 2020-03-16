import 'carrossel_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/commons/styles.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/widgets/movie_scrolling.dart';
import 'package:my_app/widgets/widget.dart';
import 'package:my_app/models/movie_model.dart';

List<ItemCarrossel> getItensCarrossel(MovieController movieController){
  List<ItemCarrossel> _return = List<ItemCarrossel>();

  for (int i = 0; i < movieController.movies.length && i < 3; i++){
    _return.add(
      new ItemCarrossel(imageUrl: movieController.movies[i].backdropPath , descricao: movieController.movies[i].title)      
    );
  }

  return _return;
}

Widget getTitle(String textTitle) {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Text(textTitle, style: textStyleTitles()),
  );
}

class MoviesView extends StatefulWidget {
  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {

  MovieController _movieController;
  @override
  void initState() {
    super.initState();
    _movieController = MovieController();
    if (_movieController.movies == null) {      
      _movieController.executeQuery(TypeQueryMovie.playNowMovie);
    }
  }     
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141A32),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ToolbarCustom(title: 'Movie'),
              
              Observer(
                builder: (_)  => _movieController.movies != null ?
                  CarrosselImgs(itens: getItensCarrossel(_movieController))
                  : Container()
              ),
              
              getTitle("Popular"),
              Container(child: ScrollingMovies(typeQueryMovie: TypeQueryMovie.popularMovie)),
              getTitle("Play now"),
              Container(child: ScrollingMovies(typeQueryMovie: TypeQueryMovie.playNowMovie)),
              getTitle("Coming son"),
              Container(child: ScrollingMovies(typeQueryMovie: TypeQueryMovie.cominSonMovie)),
            ],
          ),
        ),
      ),
    );
  }
}
