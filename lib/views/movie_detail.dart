import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:my_app/widgets/movie_item.dart';

const TEMP =
    "Peter Parker and his friends go on summer holidays to Europe. However, the friends will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.";

enum StatusSynopse { EXPANDED, COLLAPSE }

final iconTextStyle = const TextStyle(color: Colors.blue);
final bodySynopsisTextStyle = const TextStyle(color: Colors.grey);

class MovieDetail extends StatefulWidget {
  final movieIndex;
  final movieController;

  MovieDetail({this.movieController, this.movieIndex});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  // MovieController _movieController;
  Movie _movie;
  double movieWidth;
  double movieHeight;

  // @override
  // void initState() {
  //   super.initState();
  //   _movieController = GetIt.instance<MovieController>();
  // }

  Widget detailsMovie() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 150),
      height: 180,
      width: movieWidth - 50,
      child: MovieDetailWidget(
          image: _movie.image,
          title: _movie.title,
          rating: _movie.rating,
          movieCountry: _movie.details.movieCountry,
          directorName: _movie.details.directorName),
    );
  }

  Widget getWidgetSynopsis(
      String textBody, String textIcon, IconData icon, int maxLine) {
    return Column(
      children: <Widget>[
        maxLine > 0
            ? Text(
                textBody,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLine,
                textAlign: TextAlign.justify,
                style: bodySynopsisTextStyle,
              )
            : Text(textBody,
                textAlign: TextAlign.justify, style: bodySynopsisTextStyle),
        ExpandableButton(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(textIcon, style: iconTextStyle),
            Icon(icon, color: Colors.blue),
          ],
        )),
      ],
    );
  }

  Widget synopsis() {
    return ExpandableTheme(
      data: ExpandableThemeData(),
      child: ExpandableNotifier(
        child: Column(
          children: [
            Expandable(
              collapsed: getWidgetSynopsis(
                _movie.overview,
                "More",
                Icons.keyboard_arrow_down,
                3,
              ),
              expanded: getWidgetSynopsis(
                _movie.overview,
                "Hide",
                Icons.keyboard_arrow_up,
                0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, color: Colors.white),
      textAlign: TextAlign.start,
    );
  }

  Widget castPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textTitle("Cast"),
        SizedBox(height: 10),
        Container(
          height: 180,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 10, width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 160,
                    width: 120,
                    child: _movie.details.cast[index].profilePath != null
                        ? FadeInImage(
                          image: NetworkImage(_movie.details.cast[index].profilePath),
                          fit: BoxFit.cover,
                          placeholder: AssetImage('images/loading.gif'),
                        )
                        : Image.asset("images/imagenotfound.jpg",
                            fit: BoxFit.fill),
                  ),
                  Text(
                    _movie.details.cast[index].name,
                    textAlign: TextAlign.start,
                    style: bodySynopsisTextStyle,
                  )
                ],
              );
            },
            itemCount: _movie.details.cast.length,
          ),
        )
      ],
    );
  }

  Widget bannerTop() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 250,
          width: 900,
          child: Image.network(_movie.backdropPath, fit: BoxFit.fill),
        ),
        Positioned(
          top: 0,
          child: detailsMovie(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              color: Colors.white,
              onPressed: () {},
            ),
            Text("Details",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _movie = widget.movieController.getMovie(widget.movieIndex);
    movieWidth = MediaQuery.of(context).size.width;
    movieHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF151E40),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: detailsMovie(),
            ),
            Column(
              children: <Widget>[
                bannerTop(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 60),
                      textTitle("Synopsis"),
                      SizedBox(height: 10),
                      synopsis(),
                      castPanel()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
