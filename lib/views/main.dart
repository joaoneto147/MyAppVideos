import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/views/home_page.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<MovieController>(MovieController());
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyAppMovies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Google'
      ),
      home: HomePage(),
    );
  }
}
