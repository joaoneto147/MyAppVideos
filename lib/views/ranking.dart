import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/controllers/movie_controller.dart';
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
      _movieController.getMoviesRanked(1);
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
            Container(               
              margin: const EdgeInsets.symmetric(                
                horizontal: 10.0,
              ),
              child: Row(                            
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(                      
                      "Ranking",                      
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),
                    ),
                  ), 
                  Expanded(                    
                    child: Container(
                      width: 40,                      
                      height: 30,  
                      decoration: new BoxDecoration(
                        color: new Color(0XFF1E2747),    
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(3.0)
                      ),
                      child: Row(                        
                        children: <Widget>[
                          Icon(Icons.search, color: Colors.grey),
                          Expanded(                            
                            child: TextField(
                              textAlign: TextAlign.start,
                              expands: false,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20
                                ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 8),
                                border: InputBorder.none,                                                            
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20
                                )
                              )
                            )
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            
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
