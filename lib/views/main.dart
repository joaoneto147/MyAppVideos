import 'package:flutter/material.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/views/home_page.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.red,
            brightness: Brightness.light,),
        home: Home(),/*PokeDexPage()*/
      ),
      providers: [
        Provider<MovieController>(
          create: (_) => MovieController(),
        )
      ],
    );
  }
}