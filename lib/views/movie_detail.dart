import 'package:flutter/material.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/models/movie_model.dart';
import 'package:my_app/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  final heroTag;

  MovieDetail({this.heroTag});  
  
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  MovieController _movieController;
  Movie _movie;

  Widget banner(){
    return Container(
      height: 300,
      width: 900,
      color: Colors.blue,
      child: Image.network(_movie.image, fit: BoxFit.fill),
    );
  }

  Widget detailsMovie(){
    return Container(
      height: 483,
      width: 900,
      color: Colors.red
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _movieController = Provider.of<MovieController>(context);
    _movie = _movieController.getMovie(widget.heroTag);

    return Scaffold(      
      body: 

          Column(
            children: <Widget>[                 
            banner(),
            detailsMovie(),
          ],
          )

    );
  }
}

            // Container(
            //   margin: EdgeInsets.symmetric(
            //     vertical: 10,
            //     horizontal: 20
            //   ),
            //   child: Hero( 
            //     tag: widget.heroTag,
            //     child: Material(
            //       color: Colors.red,
            //       child: MovieDetailWidget(
            //         image: _movie.image,
            //         title: _movie.title, 
            //         rating: _movie.rating, 
            //         movieCountry: _movie.movieCountry, 
            //         directorName: _movie.directorName,
            //         margin: 3.0,
            //       )
            //     )
            //   )
            // )


// AppBar(
//             centerTitle: true,
//             title: Opacity(
//               opacity: 0.8,
//               child: Text(
//                 "Details",
//                 style: TextStyle(
//                     fontFamily: 'Google',
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             backgroundColor: Colors.purple,
//             elevation: 0,          
            
//             brightness: Brightness.dark,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               color: Colors.white,
//               onPressed: () {
//                 Navigator.of(context).pop(null);
//               },
//             )
//           ),