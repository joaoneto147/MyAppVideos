import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget.dart';

class ItemCarrossel{
  final String imageUrl;
  final String descricao;

  ItemCarrossel({this.imageUrl, this.descricao});
}

class CarrosselImgs extends StatefulWidget {
  final List<ItemCarrossel> itens;
  CarrosselImgs({this.itens});

  @override
  _CarrosselImgsState createState() => _CarrosselImgsState();
}

class _CarrosselImgsState extends State<CarrosselImgs> {
  int _currentIndexImg = 0;

  List<Widget> getListImgs() {
    List<Widget> list = List<Widget>();

    Widget img(int index) {
      return Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: 900,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: FadeInImage(
              image: NetworkImage(widget.itens[index].imageUrl),
              fit: BoxFit.fill,
              placeholder: AssetImage('images/loading.gif'),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                height: 32,
                width: 303,
                color: Colors.black,
                child: Text(
                  widget.itens[index].descricao,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      );
    }

    for (int i = 0; i < widget.itens.length; i++) {
      list.add(img(i));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOutCirc,
        height: 150.0,
        items: getListImgs(),
        onPageChanged: (index) {
          setState(() {
            _currentIndexImg = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildImgIndicator(_currentIndexImg, widget.itens.length),
      )
    ]);
  }
}