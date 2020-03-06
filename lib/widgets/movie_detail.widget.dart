import 'package:flutter/material.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:rating_bar/rating_bar.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);

final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.w600
);

final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);

final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 14.0
);

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;
  MovieDetailWidget(this.movie);
  
  @override
  Widget build(BuildContext context) {      
    final movieThumbnail = Container(      
      margin: EdgeInsets.symmetric(    
        horizontal: 20
      ),
      child: Image.asset(
        movie.image,
        height: 180.0,
        width: 120.0
      )
    );

    final movieCard = Container(        
      height: 124.0,
      margin: EdgeInsets.only(top: 70),
      decoration: BoxDecoration(
        color: Color(0XFF1E2747),    
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(3.0)
      ),
    );

    final descriptionMovie = Container(
      margin: EdgeInsets.fromLTRB(165.0, 70.0, 16.0, 16.0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 4.0),
          Text(movie.title,
            style: headerTextStyle,
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RatingBar.readOnly(
                initialRating: movie.rating/2,                
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
              Text(
                movie.rating.toString(),
                style: TextStyle(
                  color: Colors.amber.shade400
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(movie.movieCountry,
            style: subHeaderTextStyle

          ),
          Container(height: 10.0),
          Text("Director: " + movie.directorName,
            style: subHeaderTextStyle
          )
        ],
      ),
    );

    return Container(      
      margin: const EdgeInsets.symmetric(
         vertical: 10.0,
         horizontal: 10.0,
      ),
      child: Stack(
        children: <Widget>[
          movieCard,
          movieThumbnail,
          descriptionMovie
        ],
          
      ),
    ); 

  }  
}
