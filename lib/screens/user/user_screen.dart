import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/providers/local-storage_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(LocalStorage().userToken);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.react == REACT_AUTHENTICATION.getLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Column(
            children: [
              Text(state.user!.nombre ?? "No llego"),
              ElevatedButton(
                onPressed: () {
                  LocalStorage().clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: Text("Cerrar Sesion"),
              )
            ],
          );
        },
      ),
    );
  }
}
