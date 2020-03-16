import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SearchBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 40,
        height: 30,
        decoration: new BoxDecoration(
            color: new Color(0XFF1E2747),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(3.0)),
        child: Row(
          children: <Widget>[
            Icon(Icons.search, color: Colors.grey),
            Expanded(
              child: TextField(
                textAlign: TextAlign.start,
                expands: false,
                style: TextStyle(color: Colors.grey, fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> buildImgIndicator(int _current, int qtIndicators) {
  List<Widget> indicators = [];

  Widget pageIndicator(bool active) {
    return Container(
      width: 15.0,
      height: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: active == true ? Colors.blue.shade700 : Colors.grey.shade800,
      ),
    );
  }

  for (int i = 0; i < qtIndicators; ++i) {
    indicators.add(pageIndicator(i == _current));
  }
  return indicators;
}

class ToolbarCustom extends StatelessWidget {
  final String title;
  ToolbarCustom({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SearchBtn(),
        ],
      ),
    );
  }
}

Widget getPosterMovie(String movieImgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(6.0),
    child: Container(
      height: 120,
      width: 110,
      child: FadeInImage(
        placeholder: AssetImage('images/loading.gif'),
        image: NetworkImage(movieImgUrl),
      ),
    ),
  );
}


Widget getPathMovie(String movieImgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(6.0),
    child: Container(
      // height: 120,
      // width: 110,
      child: FadeInImage(
        placeholder: AssetImage('images/loading.gif'),
        image: NetworkImage(movieImgUrl),
      ),
    ),
  );
}


Widget fakeItem() {
  return Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.all(5),
          height: 160,
          width: 120,
          color: Colors.grey[300] //grey[300],
          ),
      Container(
        margin: EdgeInsets.all(5),
        height: 20,
        width: 120,
        color: Colors.grey[300],
      ),
    ],
  );
}

