import 'package:flutter/material.dart';
import 'package:my_app/controllers/movie_controller.dart';
import 'package:my_app/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  final heroTag;

  MovieDetail({this.heroTag});  
  
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final _movieController = Provider.of<MovieController>(context);
    final _movie = _movieController.getMovie(widget.heroTag);

    return Scaffold(      
      body: Column(
        children: <Widget>[
           
          SizedBox(height: 20),
          Container(
            // height: 200,
            // width: 200,
            child: Hero( 
              tag: widget.heroTag,
              child: MovieDetailWidget(                                                        
                image: _movie.image,
                title: _movie.title, 
                rating: _movie.rating, 
                movieCountry: _movie.movieCountry, 
                directorName: _movie.directorName
              )
            )
          )
        ],

      )
    );
  }
}


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