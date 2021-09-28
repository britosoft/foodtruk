import 'package:flutter/material.dart';

class Metodo_Pago extends StatelessWidget {
  const Metodo_Pago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [Metodo(), _Container_Pago(), ButtonPago()],
        ),
      ),
    ));
  }
}

class Metodo extends StatefulWidget {
  Metodo({Key? key}) : super(key: key);

  @override
  _MetodoState createState() => _MetodoState();
}

class _MetodoState extends State<Metodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Elige una forma de pago en la entrega',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}

class _Container_Pago extends StatelessWidget {
  const _Container_Pago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 450,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.all(20.0),
        child: Column(children: [RadioButton()]),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int? _genero;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RadioListTile(
            value: 1,
            title: Text('Efectivo'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
              value: 2,
              title: Text('Tarjeta Clave(POS)'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
              value: 3,
              title: Text('Mastercard'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
              value: 4,
              title: Text('Visa'),
              groupValue: _genero,
              onChanged: _setSelectedRadio)
        ],
      ),
    );
  }

  _setSelectedRadio(int? valor) {
    _genero = valor;
    setState(() {});
  }
}

class ButtonPago extends StatelessWidget {
  const ButtonPago({Key? key}) : super(key: key);

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
                    onPressed: () => Navigator.pushNamed(context, 'sendOrder'),
                    child: const Text('Continuar',
                        style: TextStyle(color: Colors.white))),
              ],
            )));
  }
}
