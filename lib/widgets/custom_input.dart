import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.controller,
      @required this.keyboardType = TextInputType.text,
      @required this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 5),
                    blurRadius: 5,
                  )
                ]),
            child: TextField(
                controller: this.controller,
                autocorrect: false,
                keyboardType: this.keyboardType,
                obscureText: isPassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(this.icon, color: Colors.green),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: this.placeholder)),
          )
        ]));
  }
}
