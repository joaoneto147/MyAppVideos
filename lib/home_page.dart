import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

const SINOPSE = 
  "Depois de anos vivendo como um cachorro de estimação na casa de uma família na " +
  "Califórnia, Buck precisa entrar em contato com os seus instintos mais selvagens " + 
  "para conseguir sobreviver em um ambiente hostil como o Alaska. Com o tempo, seu " +
  "lado feroz se desenvolve e ele se torna o grande líder de sua matilha. Baseado no " +
  "livro homônimo de Jack London, lançado em 1903.";


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        color: Color(0xFF606060),                
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[                            
            Column(                                
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(                                          
                  width: 169,
                  height: 240,
                  child: Image.asset("images/chamado_da_floresta.jpg", fit: BoxFit.cover)
                ),
              ],  
            ),

            Flexible(
              fit: FlexFit.tight,
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.start,               
                crossAxisAlignment: CrossAxisAlignment.start,                
                children: <Widget>[                  
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "O Chamado da Floresta",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),

                  Center(                      
                    child: RatingBar(
                      onRatingChanged: (rating) => setState(() => _rating = rating),
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: true,
                      filledColor: Colors.amber,
                      emptyColor: Colors.grey,
                      halfFilledColor: Colors.amberAccent, 
                      size: 20,
                    )
                  ),
            
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(                      
                      SINOPSE,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 11,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Barlow'
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),                        
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Text(
                          "Adicionar a minha lista",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],  
              ),
            )
          ],
        ) ,
      )
    );
  }
}