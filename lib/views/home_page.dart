import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:my_app/views/ranking.dart';

//temp view
class Yellow extends StatefulWidget {
  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.red,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (currentIndex){
            print(currentIndex);
          },
            iconSize: 20,
            selectedIconTheme:
                IconThemeData(color: Color(0xFF0083FF), size: 25),
            unselectedIconTheme:
                IconThemeData(color: Color(0xFF53719C), size: 20),
            fixedColor: Color(0xFF0083FF),
            backgroundColor: Color(0xFF1E2747),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  title: Text("Movie"),
                  icon: Icon(CommunityMaterialIcons.movie_roll)),
              BottomNavigationBarItem(
                  title: Text("Ranking"),
                  icon: Icon(CommunityMaterialIcons.crown)),
              BottomNavigationBarItem(
                  title: Text("Feed"),
                  icon: Icon(CommunityMaterialIcons.crown)),
              BottomNavigationBarItem(
                  title: Text("More"), icon: Icon(Icons.person))
            ]));
  }
}
