import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget.dart';
import 'package:rating_bar/rating_bar.dart';

final baseTextStyle = const TextStyle(fontFamily: 'Poppins');

final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

final regularTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df), fontSize: 9.0, fontWeight: FontWeight.w400);

final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 14.0);

EdgeInsets getMargin(double mult) {
  mult = (mult == null) ? 1 : mult;
  return EdgeInsets.symmetric(horizontal: 10 * mult, vertical: 10 * mult);
}

class MovieDetailWidget extends StatelessWidget {
  final image;
  final title;
  final rating;
  final movieCountry;
  final directorName;
  final movieThumbnailWidth = 120.0;
  final margin;

  Widget movieThumbnail() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: 105,
              child: getPosterMovie(image)
            ),
            SizedBox(height: 10)
          ],
        ));
  }

  Widget descriptionMovie() {
    return Container(
      margin: EdgeInsets.fromLTRB(movieThumbnailWidth + 20, 5, 2, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: headerTextStyle),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              RatingBar.readOnly(
                initialRating: rating / 2,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                halfFilledIcon: Icons.star_half,
                isHalfAllowed: true,
                filledColor: Colors.amber.shade400,
                emptyColor: Colors.grey,
                halfFilledColor: Colors.amber.shade400,
                size: 16,
              ),
              SizedBox(width: 10),
              Text(rating.toString(),
                  style: TextStyle(
                      color: Colors.amber.shade400,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10),
          Text(movieCountry, style: subHeaderTextStyle),
          Container(height: 10.0),
          Text("Director: " + directorName, style: subHeaderTextStyle)
        ],
      ),
    );
  }

  const MovieDetailWidget(
      {this.image,
      this.title,
      this.rating,
      this.movieCountry,
      this.directorName,
      this.margin});

  @override
  Widget build(BuildContext context) {
    final movieCard = Container(
        height: 140,
        margin: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
            color: Color(0XFF1E2747),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(3.0)),
        child: descriptionMovie());

    return Container(
      margin: getMargin(margin),
      child: Stack(
        children: <Widget>[movieCard, movieThumbnail()],
      ),
    );
  }
}
