import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:my_app/commons/api_movie.dart';
import 'package:my_app/commons/styles.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:my_app/widgets/widget.dart';

getMoviesIds(List<Movie> movies) {
  List<int> _moviesIds = List<int>();
  movies.forEach((movie) {
    _moviesIds.add(movie.id);
  });
}

class FeedMovie extends StatefulWidget {
  @override
  _FeedMovieState createState() => _FeedMovieState();
}

class _FeedMovieState extends State<FeedMovie> {
  MovieController _movieController;

  @override
  void initState() {
    super.initState();
    _movieController = MovieController();
    if (_movieController.movies == null) {
      _movieController.executeQuery(TypeQueryMovie.playNowMovie);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141A32),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 30),
        child: Column(
          children: <Widget>[
            ToolbarCustom(title: 'Feed'),
            Expanded(
                child: Observer(
                    name: 'Trailers',
                    builder: (_) => _movieController.movies != null
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _movieController.movies.length,
                            itemBuilder: (context, index) {
                              if (_movieController.movies[index].backdropPath !=
                                  '') {
                                return ItemFeed(
                                    movie: _movieController.movies[index]);
                              }
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ))),
          ],
        ),
      ),
    );
  }
}

class ItemFeed extends StatelessWidget {
  final Movie movie;

  ItemFeed({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Color(0XFF1E2747),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(3.0)),
                child: getPathMovie(movie.backdropPath),
              ),
              Icon(Icons.play_circle_outline, size: 60, color: Colors.white)
            ],
          ),
          onTap: () {
            FlutterYoutube.playYoutubeVideoById(
                apiKey: YOUTUBE_API_KEY,
                videoId: movie.details.trailers[0].key,
                autoPlay: true,
                fullScreen: true);
          },
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width - 20,
          child: Text(
            movie.title,
            style: textStyleTitles(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('144', style: TextStyle(color: Color(0xFF7989A1))),
            SizedBox(width: 4),
            Icon(Icons.favorite, color: Colors.red, size: 22),
            SizedBox(width: 4),
            Text(
              '4340',
              style: TextStyle(color: Color(0xFF7989A1)),
            ),
            SizedBox(width: 4),
            Icon(Icons.comment, color: Color(0xFF7989A1), size: 22),
            SizedBox(width: 4),
            Text('126', style: TextStyle(color: Color(0xFF7989A1))),
            SizedBox(width: 4),
            Icon(Icons.open_in_new, color: Color(0xFF7989A1), size: 22),
          ],
        ),
      ],
    );
  }
}
