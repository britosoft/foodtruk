import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        //color: Colors.yellow,
        child: Swiper(
            itemCount: 10,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.7,
            itemHeight: size.height * 0.4,
            itemBuilder: (_, int index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: 'movie-instance'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://via.placeholder.com/300x400'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }));
  }
}
