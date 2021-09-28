import 'package:flutter/material.dart';

class Asking_Screen extends StatelessWidget {
  const Asking_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIcon(),
              MiPedido(),
              FoodTruck(),
              SubTotal(),
              _AddButton(),
              SizedBox(height: 20),
              NextButton()
            ],
          ),
        ),
      ),
    ));
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.next_plan),
          MaterialButton(
              onPressed: () => Navigator.pushNamed(context, 'home'),
              child: const Text('Editar'))
        ],
      ),
    );
  }
}

class MiPedido extends StatelessWidget {
  const MiPedido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      //margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Text(
        'Mi pedido',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FoodTruck extends StatelessWidget {
  const FoodTruck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 4),
          blurRadius: 3,
        )
      ], borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [cantidad(), Producto(), Precio()],
      ),
    ));
  }
}

class Franquicia extends StatelessWidget {
  const Franquicia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Umami/Calle 50',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            Text(r'10-25 min - Envío $190. $3 mínimo',
                style: TextStyle(fontSize: 12)),
          ],
        ));
  }
}

class Producto extends StatelessWidget {
  const Producto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text('Paella de camaron',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ],
        ));
  }
}

class cantidad extends StatelessWidget {
  const cantidad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('1x',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
      ],
    );
  }
}

class Precio extends StatelessWidget {
  const Precio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(r'$3.25',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ))
    ]));
  }
}

class SubTotal extends StatelessWidget {
  const SubTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Sum(), SumNumber()]));
  }
}

class Sum extends StatelessWidget {
  const Sum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text('SubTotal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
          ],
        ));
  }
}

class SumNumber extends StatelessWidget {
  const SumNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text(r'$5.20',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ));
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[200],
                boxShadow: []),
            child: Column(
              children: [
                MaterialButton(
                    onPressed: () => Navigator.pushNamed(context, 'home'),
                    child: const Text('Agrear más comida')),
              ],
            )));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                MaterialButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'formaDePago'),
                    child: const Text('Continuar',
                        style: TextStyle(color: Colors.white))),
              ],
            )));
  }
}
