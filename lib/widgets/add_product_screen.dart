import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [ContainerAdd_Product(), Card_AddProduct()],
            )),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save_outlined),
              onPressed: () {},
            )));
  }
}

class ContainerAdd_Product extends StatelessWidget {
  const ContainerAdd_Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ImageAddProduct(),
          IconBack_ddProduct(),
          IconCamera_ddProduct()
        ],
      ),
    );
  }
}

class ImageAddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(
              'https://media.istockphoto.com/photos/corona-extra-picture-id537096775?b=1&k=6&m=537096775&s=170667a&w=0&h=mVGknpTiLfzYr02oFdtOLusxavXmqDjmfpUuY3VV6Wo='),
          fit: BoxFit.cover,
        ));
  }
}

class IconBack_ddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class IconCamera_ddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.camera_alt_rounded, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class Card_AddProduct extends StatelessWidget {
  const Card_AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 4), blurRadius: 3),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [Input_AddProduct()]),
    );
  }
}

class Input_AddProduct extends StatelessWidget {
  const Input_AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                hintText: 'Nombre del producto',
                labelText: 'Nombre '),
          ),
          TextFormField(
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                hintText: '0.0',
                labelText: 'Precio '),
          ),
        ],
      ),
    );
  }
}
