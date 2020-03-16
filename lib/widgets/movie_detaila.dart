import 'package:flutter/material.dart';

class MovieDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(      
      //padding: EdgeInsets.only(),
      height: 100,
      width: _width -20,
      color: Colors.red,      
    );
  }
}