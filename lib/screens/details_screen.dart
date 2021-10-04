import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:umami/screens/cantidad_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            _BackgroundImage(),
            _DescriptionProduct(),
            _Unidades(),
            CantidadScreen(),
            _Coment(),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/04/04/11/55/paella-2201193_960_720.jpg'),
            fit: BoxFit.cover)
      ],
    ));
  }
}

class _DescriptionProduct extends StatelessWidget {
  const _DescriptionProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.symmetric(vertical: 10),
        child: Center(
            child: Column(
      children: [
        Text('Paella de camarón',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        Text(
          r' $ 3.25',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    )));
  }
}

class _Unidades extends StatelessWidget {
  const _Unidades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Title(color: Colors.black, child: Text('Unidades'))],
      ),
    );
  }
}

/// This is the private State class that goes with MyStatefulWidget.
class _Coment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                  )),
                  hintText: '¿Quieres aclarar algo?',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  onPressed: () => Navigator.pushNamed(context, 'asking'),
                  child: const Text(r'Agregar a mi pedido $3.25',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}

class IconBack extends StatelessWidget {
  const IconBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.add, color: Colors.red),
    );
  }
}
