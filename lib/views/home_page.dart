import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/movie_detail.widget.dart';
import 'package:my_app/models/movie_model.dart';

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
  _getMovies(){
    
    Movie movie = Movie();
    movie.getTrendingMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF141A32),
        padding: EdgeInsets.only(bottom: 10),        
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            RaisedButton(
              child: Text("Get Movies Test"),
              onPressed: () => _getMovies()
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
              child: ListView.builder(
                itemBuilder: (BuildContext ctxt, int index){
                  return MovieDetailWidget(movies[index]);
                },
                itemCount: movies.length
              ),
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
