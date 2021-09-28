part of 'authentication_bloc.dart';

class AuthenticationState<T> {
  //Variables
  final EUser? user;
  final REACT_AUTHENTICATION? react;

//Contructor
  AuthenticationState({this.user, this.react});

//Metodo que cambia el estado, sin afectar el estado anterior
  AuthenticationState<T> copyWith({
    required AuthenticationState state,
    EUser? user,
    REACT_AUTHENTICATION? react,
  }) =>
      AuthenticationState<T>(
        user: user ?? state.user,
        react: react ?? state.react,
      );
}

class Loading extends AuthenticationState<Loading> {}

class Success extends AuthenticationState<Success> {}

class Issue extends AuthenticationState<Issue> {}

//Reacciones
enum REACT_AUTHENTICATION {
  initial,

  getLoading,
  getSuccess,
  getError,
  getErrorEmailNoExist,
  getTokenNoValid,

  postLoading,
  postSuccess,
  postError,

  putLoading,
  putSuccess,
  putError,

  deleteLoading,
  deleteSuccess,
  deleteError,
}
