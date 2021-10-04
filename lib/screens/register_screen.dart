import 'package:umami/core/blocs/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:umami/screens/user/user_screen.dart';
import 'package:umami/widgets/custom_labels.dart';
import 'package:umami/widgets/custom_logo.dart';
import 'package:umami/widgets/text-field_widget/text-field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formState = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
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
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 30,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      key: _formState,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Logo(titulo: 'Registro'),
                          TextFieldWidget(
                            controller: controllerName,
                            title: "",
                            placeholder: "Inserte el nombre",
                            validator: (data) {
                              if (data == "") {
                                return "Este campo es obligatorio";
                              }
                              return null;
                            },
                          ),
                          TextFieldWidget(
                            controller: controllerEmail,
                            title: "",
                            placeholder: "Inserte el email",
                            validator: (data) {
                              if (data == "") {
                                return "Este campo es obligatorio";
                              }
                              return null;
                            },
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
                                return "La contraseña debe ser mayor a 8 digitos";
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print(controllerName.text);
                                print(controllerEmail.text);
                                print(controllerPassword.text);
                                if (_formState.currentState!.validate()) {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(
                                    Register(
                                      nombre: controllerName.text,
                                      email: controllerEmail.text,
                                      password: controllerPassword.text,
                                    ),
                                  );
                                  Navigator.pushReplacementNamed(
                                      context, 'home');
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, 'register');
                                }
                              },
                              icon: (state.react ==
                                      REACT_AUTHENTICATION.getLoading)
                                  ? CupertinoActivityIndicator()
                                  : Icon(Icons.verified_user_outlined),
                              label: Text("Registro"),
                              style: ElevatedButton.styleFrom(
                                primary: _flag ? Colors.green : Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Labels(
                            ruta: 'login',
                            titulo: '¿Ya tienes cuenta?',
                            subTitulo: 'Ingresar!',
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
