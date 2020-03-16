import 'package:flutter/material.dart';
import 'package:my_app/commons/styles.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/views/movie_detail.dart';
import 'package:my_app/widgets/widget.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

Widget getTitle(String textTitle) {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Text(textTitle, style: textStyleTitles()),
  );
}

class ScrollingMovies extends StatelessWidget {
  final widthMovieImg = 120.0;
  final TypeQueryMovie typeQueryMovie;
  ScrollingMovies({this.typeQueryMovie});

  @override
  Widget build(BuildContext context) {
    MovieController _movieController = MovieController();
    _movieController.executeQuery(typeQueryMovie);

    return Observer(
      name: 'scrollingMovie',
      builder: (_) => _movieController.movies != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10, width: 10);
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.zero,
                                height: 160,
                                child: getPosterMovie(
                                    _movieController.movies[index].image)),
                            Container(
                              padding: EdgeInsets.only(bottom: 3, top: 1),
                              width: widthMovieImg,
                              child: Text(
                                _movieController.movies[index].title,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                RatingBar.readOnly(
                                  initialRating:
                                      _movieController.movies[index].rating /
                                          2.0,
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  halfFilledIcon: Icons.star_half,
                                  isHalfAllowed: true,
                                  filledColor: Colors.amber.shade400,
                                  emptyColor: Colors.grey,
                                  halfFilledColor: Colors.amber.shade400,
                                  size: 16,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  _movieController.movies[index].rating
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MovieDetail(movieIndex: index, movieController: _movieController)
                            ));
                        },
                      );
                    },
                    itemCount: _movieController.movies.length,
                  ),
                ),
              ],
            )
          : Shimmer.fromColors(
              child: Opacity(
                opacity: 0.4,
                child: Row(
                  children: <Widget>[fakeItem(), fakeItem(), fakeItem()],
                ),
              ),
              baseColor: Colors.white,
              highlightColor: Colors.grey,
            ),
    );
  }
}
