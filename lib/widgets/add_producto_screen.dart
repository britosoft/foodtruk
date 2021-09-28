import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umami/providers/product_provider.dart';
import 'package:umami/widgets/product_image.dart';

class Add_productScreen extends StatelessWidget {
  const Add_productScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [ContainerCreate_Product(), Card_CreateProduct()],
            )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.save_outlined, color: Colors.white),
              onPressed: () {},
            )));
  }
}

class ContainerCreate_Product extends StatelessWidget {
  const ContainerCreate_Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ImageCreateProduct(),
          IconBack_CreateProduct(),
          IconCamera_CreateProduct()
        ],
      ),
    );
  }
}

class ImageCreateProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        child: ProductImage());
  }
}

class IconBack_CreateProduct extends StatelessWidget {
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

class IconCamera_CreateProduct extends StatelessWidget {
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

class Card_CreateProduct extends StatelessWidget {
  const Card_CreateProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 4), blurRadius: 3),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [Input_CreateProduct()]),
    );
  }
}

class Input_CreateProduct extends StatelessWidget {
  const Input_CreateProduct({Key? key}) : super(key: key);

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
