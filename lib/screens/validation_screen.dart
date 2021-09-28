import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/core/blocs/validation_bloc/bloc/validation_bloc.dart';
import 'package:umami/screens/login_screen.dart';
import 'package:umami/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ValidationBloc, ValidationState>(
        listener: (context, state) {
          if (state.react == REACT_VALIDATION.login) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          }
          if (state.react == REACT_VALIDATION.home) {
            BlocProvider.of<AuthenticationBloc>(context).add(GetUserById());

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => UserScreen()),
                (route) => false);
          }
        },
        child: Container(),
      ),
    );
  }
}
