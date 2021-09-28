import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Categoria_sandwich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Sandwich',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _Sandwich(),
            ),
          )
        ],
      ),
    );
  }
}

class _Sandwich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 190,
      // color: Colors.green,
      //margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/03/21/11/17/burger-4953465__480.jpg'),
                width: 250,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Paellas de marisco ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            r' $ 3.25 ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
