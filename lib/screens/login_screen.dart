import 'package:provider/provider.dart';
import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/providers/local-storage_provider.dart';
import 'package:umami/screens/screen.dart';
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
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, AuthenticationState state) {
          bool _flag = true;
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
                          Align(
                              alignment: Alignment.center,
                              child: Logo(titulo: 'Login')),
                          TextFieldWidget(
                            controller: controllerEmail,
                            title: "",
                            placeholder: "Email",
                            validator: (data) {
                              if (data == "") {
                                return "Este campo es obligatorio";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                            controller: controllerPassword,
                            title: "",
                            placeholder: "Insert password",
                            obscureText: true,
                            validator: (data) {
                              if (data == "") {
                                return "Este campo es obligatorio";
                              }
                              if (data!.length < 6) {
                                return "La contraseña debe ser mayor a 6 digitos";
                              }
                              return null;
                            },
                          ),
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
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                      (route) => false);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Error al iniciar sesión vulva a intentarlo nuevamente")));
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
