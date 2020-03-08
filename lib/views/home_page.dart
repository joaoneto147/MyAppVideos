import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/widgets/movie_item.dart';
import 'package:provider/provider.dart';

import 'movie_detail.dart';

final iconTextStyle = const TextStyle(
  color: Colors.red
);

const TITLE = "O Chamado da Floresta";
const SINOPSE = 
  "Depois de anos vivendo como um cachorro de estimação na casa de uma família na " +
  "Califórnia, Buck precisa entrar em contato com os seus instintos mais selvagens " + 
  "para conseguir sobreviver em um ambiente hostil como o Alaska. Com o tempo, seu " +
  "lado feroz se desenvolve e ele se torna o grande líder de sua matilha. Baseado no " +
  "livro homônimo de Jack London, lançado em 1903.";   

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { 
  @override
  Widget build(BuildContext context) {
    var _movieController = Provider.of<MovieController>(context);
    _movieController.fetchMoviesRanked();   
        
    reloadMovies(){        
      _movieController.fetchMoviesRanked();
    }

    return Scaffold(
      body: Container(
        color: Color(0xFF141A32),
        padding: EdgeInsets.only(bottom: 10),        
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            RaisedButton(
              child: Text("Get Movies Test"),
              onPressed: () => reloadMovies()
            ),
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
                builder: (_) => (_movieController.api != null && _movieController.api.movie != null)
                  ? Container(
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return GestureDetector(
                          child: Hero( 
                            tag: index,
                            child: Material(
                              elevation: 1,
                              color: Color(0xFF141A32),
                              child: MovieDetailWidget(                                                        
                                image: _movieController.api.movie[index].image,
                                title: _movieController.api.movie[index].title, 
                                rating: _movieController.api.movie[index].rating, 
                                movieCountry: _movieController.api.movie[index].movieCountry, 
                                directorName: _movieController.api.movie[index].directorName
                              )
                            )
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MovieDetail(heroTag: index)
                            ));
                          }
                        );
                      },
                      itemCount: _movieController.api.movie.length
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
        
      bottomNavigationBar: BottomNavigationBar(       
        iconSize: 20,
        selectedIconTheme: IconThemeData(color: Color(0xFF0083FF), size: 25),        
        unselectedIconTheme: IconThemeData(color: Color(0xFF53719C), size: 20),
        
        fixedColor: Color(0xFF0083FF),
        backgroundColor: Color(0xFF1E2747),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Movie"),
            icon: Icon(CommunityMaterialIcons.movie_roll)
          ),
          BottomNavigationBarItem(
            title: Text("Ranking"),
            icon: Icon(CommunityMaterialIcons.crown)
          ),
          BottomNavigationBarItem(
            title: Text("Feed"),
            icon: Icon(CommunityMaterialIcons.crown)
          ),
          BottomNavigationBarItem(
            title: Text("More"),
            icon: Icon(Icons.person)
          )
        ]
      )
    );
  }

  

  
}
