part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class Login extends AuthenticationEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}

class Register extends AuthenticationEvent {
  final String nombre;
  final String email;
  final String password;

  Register({required this.nombre, required this.email, required this.password});
}

class GetUserById extends AuthenticationEvent {}

class GetUser extends AuthenticationEvent {}
