import 'package:provider/provider.dart';
import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/screens/user/user_screen.dart';
import 'package:umami/widgets/custom_input.dart';
import 'package:umami/widgets/custom_labels.dart';
import 'package:umami/widgets/custom_logo.dart';
import 'package:umami/widgets/text-field_widget/text-field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formState = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Umami'),
      ),
      body: connectWithBloc(),
    );
  }

  Widget connectWithBloc() {
    bool _flag = true;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.react == REACT_AUTHENTICATION.getSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserScreen()),
              (route) => false);
        }
        if (state.react == REACT_AUTHENTICATION.getError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Hubo un error con el servidor")));
        }
        if (state.react == REACT_AUTHENTICATION.getErrorEmailNoExist) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Por favor inserte un usuario valido")));
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, AuthenticationState state) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      key: _formState,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Logo(titulo: 'Login'),
                          TextField(),
                          SizedBox(height: 5),
                          TextFieldPassword(),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(Login(
                                    email: controllerEmail.text,
                                    password: controllerPassword.text,
                                  ));
                                }
                              },
                              icon: (state.react ==
                                      REACT_AUTHENTICATION.getLoading)
                                  ? CupertinoActivityIndicator()
                                  : Icon(Icons.verified_user_outlined),
                              label: Text("Login"),
                              style: ElevatedButton.styleFrom(
                                primary: _flag ? Colors.green : Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Labels(
                            ruta: 'register',
                            titulo: '¿No tienes cuenta?',
                            subTitulo: 'Crea una ahora!',
                          ),
                          Text(
                            'Términos y condiciones de uso',
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TextField extends StatefulWidget {
  const TextField({Key? key}) : super(key: key);

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();

    return Container(
        child: Column(children: [
      CustomInput(
        icon: Icons.mail_outline,
        controller: controllerEmail,
        // title: "Email",
        placeholder: "Email",
      ),
    ]));
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerPassword = TextEditingController();

    return Container(
        child: Column(children: [
      CustomInput(
        icon: Icons.lock_outline,
        controller: controllerPassword,
        // title: "Password",
        placeholder: "Contraseña",
      ),
    ]));
  }
}
