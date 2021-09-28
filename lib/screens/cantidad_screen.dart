import 'package:flutter/material.dart';

class CantidadScreen extends StatefulWidget {
  CantidadScreen({Key? key}) : super(key: key);

  @override
  _CantidadScreenState createState() => _CantidadScreenState();
}

class _CantidadScreenState extends State<CantidadScreen> {
  int _cantidad = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      // width: 370,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.green),
        borderRadius: BorderRadius.all(
          const Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              _cantidad--;
              setState(() {});
            },
          ),
          Text('$_cantidad', style: TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _cantidad++;

              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
