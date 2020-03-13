import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/controllers/home_page_controller.dart';

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
  HomePageController _homePageController;

  @override
  void initState() {
    super.initState();
    _homePageController = GetIt.instance<HomePageController>();
    _homePageController.pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Observer(
      name: "PageIndex",
      builder: (_) => Scaffold(
        body: _homePageController.getCurrentPage(_homePageController.pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _homePageController.pageIndex,
          onTap: (currentIndex) {
            _homePageController.pageIndex = currentIndex;
          },
          iconSize: 20,
          selectedItemColor: Color(0xFF0083FF),
          unselectedItemColor: Colors.white,
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
                title: Text("Feed"), icon: Icon(CommunityMaterialIcons.crown)),
            BottomNavigationBarItem(
              title: Text("More"),
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
