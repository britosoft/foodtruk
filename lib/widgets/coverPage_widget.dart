import 'package:flutter/material.dart';
import 'package:umami/screens/product_screen.dart';

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: Stack(children: [
          Cover(),
          IconBack(),
        ]));
  }
}

class Cover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2014/07/21/23/04/paella-398968__340.jpg'),
          fit: BoxFit.cover,
        ));
  }
}
