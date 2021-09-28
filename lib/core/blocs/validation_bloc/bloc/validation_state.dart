part of 'validation_bloc.dart';

class ValidationState<T> {
  //Variables
  final REACT_VALIDATION? react;

//Contructor
  ValidationState({this.react});

//Metodo que cambia el estado, sin afectar el estado anterior
  ValidationState<T> copyWith({
    required ValidationState state,
    REACT_VALIDATION? react,
  }) =>
      ValidationState<T>(
        react: react ?? state.react,
      );
}

class Loading extends ValidationState<Loading> {}

class Success extends ValidationState<Success> {}

class Issue extends ValidationState<Issue> {}

//Reacciones
enum REACT_VALIDATION {
  initial,

  login,
  home,
}
