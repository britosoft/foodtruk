import 'package:flutter/material.dart';

import 'login_screen.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.cargando(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
                child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2)));
          }),
    );
  }

  Future cargando(BuildContext context) async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );

    Navigator.pushReplacementNamed(context, 'login');
  }
}
