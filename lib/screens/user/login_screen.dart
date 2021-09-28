import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/screens/user/user_screen.dart';
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
        title: Text('Material App Bar'),
      ),
      body: connectWithBloc(),
    );
  }

  Widget connectWithBloc() {
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
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    key: _formState,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        TextFieldWidget(
                          controller: controllerEmail,
                          title: "Email",
                          placeholder: "Insert email",
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
                          title: "Password",
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
                              }
                            },
                            icon:
                                (state.react == REACT_AUTHENTICATION.getLoading)
                                    ? CupertinoActivityIndicator()
                                    : Icon(Icons.verified_user_outlined),
                            label: Text("Login"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
