import 'package:flutter/material.dart';

class btn_enviar extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const btn_enviar({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      elevation: 2,
      highlightElevation: 5,
      color: Colors.green,
      disabledColor: Colors.grey,
      shape: StadiumBorder(),
      child: Container(
        width: 300,
        height: 45,
        child: Center(
            child: Text(this.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ))),
      ),
    );
  }
}
