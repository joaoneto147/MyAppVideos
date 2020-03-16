import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:my_app/widgets/widget.dart';
import 'package:my_app/widgets/movie_item.dart';

import 'movie_detail.dart';

final iconTextStyle = const TextStyle(
  color: Colors.red
);

class Ranking extends StatefulWidget {
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> { 
  MovieController _movieController;

  @override
  void initState() {
    super.initState();
    _movieController = MovieController();
    if (_movieController.movies == null) {      
      _movieController.executeQuery(TypeQueryMovie.topRated);
    }
  }  

  @override
  Widget build(BuildContext context) {       
    return Scaffold(
      body: Container(
        color: Color(0xFF141A32),
        padding: EdgeInsets.only(bottom: 10),        
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            ToolbarCustom(title: 'Ranking'),            
            Expanded(              
              child: Observer(
                name: 'pagehome',
                builder: (_) => (_movieController.movies != null)
                  ? Container(
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return GestureDetector(
                          child: Hero( 
                            tag: "movie" + _movieController.movies[index].id.toString(),
                            child: Material(
                              elevation: 1,
                              color: Color(0xFF141A32),
                              child: MovieDetailWidget(                                                        
                                image: _movieController.movies[index].image,
                                title: _movieController.movies[index].title, 
                                rating: _movieController.movies[index].rating, 
                                movieCountry: _movieController.movies[index].details.movieCountry, 
                                directorName: _movieController.movies[index].details.directorName
                              )
                            )
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MovieDetail(movieIndex: index, movieController: _movieController)
                            ));
                          }
                        );
                      },
                      itemCount: _movieController.movies.length
                    ),
                  )
                  : Center(
                    child: CircularProgressIndicator()
                  )
              )
            )
          ],
        ),
      ),
    );
  }
}
