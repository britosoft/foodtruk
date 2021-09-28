import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Send_order extends StatelessWidget {
  const Send_order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        children: [
          NameFood(),
          SizedBox(height: 20),
          ContainerOrder(),
          SizedBox(height: 5),
          ContainerFormaPago(),
          SizedBox(height: 5),
          ContainerDireccion(),
          SizedBox(height: 10),
          _EnviarPedido()
        ],
      ),
    )));
  }
}

class ContainerOrder extends StatelessWidget {
  const ContainerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyOrder(),
          SizedBox(height: 5),
          Shipping(),
          SizedBox(height: 10),
          SubTotal(),
          SizedBox(height: 10),
          Total(),
        ],
      ),
    );
  }
}

class ContainerFormaPago extends StatelessWidget {
  const ContainerFormaPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        children: [TituloFormaPago(), FormaDe_Pago()],
      ),
    );
  }
}

class NameFood extends StatelessWidget {
  const NameFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Umami/Calle 50',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(r'10 -25 min. Envío $190', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Mi pedido', style: TextStyle(fontSize: 14)),
          Text(r' $7.35', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class Shipping extends StatelessWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Envío', style: TextStyle(fontSize: 14)),
          Text(r' $1.95', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class SubTotal extends StatelessWidget {
  const SubTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Subtotal', style: TextStyle(fontSize: 14)),
          Text(r' $7.35', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class Total extends StatelessWidget {
  const Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(r' $8.35',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class FormaDe_Pago extends StatelessWidget {
  const FormaDe_Pago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Efectivo', style: TextStyle(fontSize: 12)),
          Text(r' $8.35', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class TituloFormaPago extends StatelessWidget {
  const TituloFormaPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Forma de Pago',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ContainerDireccion extends StatelessWidget {
  const ContainerDireccion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_rounded),
          Detalles(),
        ],
      ),
    );
  }
}

class Detalles extends StatelessWidget {
  const Detalles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Detalle de entrega',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text('Plaza Tocumen Sur',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text('Soluciones indutriales #2', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _EnviarPedido extends StatelessWidget {
  const _EnviarPedido({Key? key}) : super(key: key);

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
                    onPressed: () => Navigator.pushNamed(context, 'send'),
                    child: const Text('Enviar',
                        style: TextStyle(color: Colors.white))),
              ],
            )));
  }
}
