import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/views/movie_detail.dart';

import 'movie_item.dart';

class MovieUpComingList extends StatelessWidget {  
  final MovieController _movieController = MovieController();
 
  @override
  Widget build(BuildContext context) {
    _movieController.getMoviesUpComing();
    return 
      Observer(
        name: 'pagehome',
        builder: (_) => (_movieController.movies != null)
          ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
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
      );
  }
}