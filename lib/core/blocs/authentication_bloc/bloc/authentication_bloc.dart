import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:umami/core/entities/user/user_entity.dart';
import 'package:umami/core/repositories/authentication_repository/authentication_repository.dart';
import 'package:umami/providers/local-storage_provider.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository)
      : super(
          AuthenticationState(
            user: EUser(),
            react: REACT_AUTHENTICATION.initial,
          ),
        );

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is Login) {
      yield Loading().copyWith(
        state: state,
        react: REACT_AUTHENTICATION.getLoading,
      );
      yield* _login(event.email, event.password);
    }
    if (event is Register) {
      yield Loading().copyWith(
        state: state,
        react: REACT_AUTHENTICATION.getLoading,
      );
      yield* _register(event.nombre, event.email, event.password);
    }
    if (event is GetUserById) {
      yield Loading().copyWith(
        state: state,
        react: REACT_AUTHENTICATION.getLoading,
      );
      // yield* _getUserById();
    }
  }

  Stream<AuthenticationState> _login(String email, String password) async* {
    try {
      final serialize = {
        "email": email,
        "password": password,
      };
      final dataResponse = await authenticationRepository.login(serialize);
      if (dataResponse.success!) {
        LocalStorage().userToken = (dataResponse.content!.token!);
        yield Success().copyWith(
          state: state,
          user: dataResponse.content,
          react: REACT_AUTHENTICATION.getSuccess,
        );
      } else {
        switch (dataResponse.error!.message!) {
          case "User no exist":
            yield Issue().copyWith(
              state: state,
              react: REACT_AUTHENTICATION.getErrorEmailNoExist,
            );
            break;
        }
      }
    } catch (Exception) {
      yield Issue().copyWith(
        state: state,
        react: REACT_AUTHENTICATION.getError,
      );
    }
  }

  Stream<AuthenticationState> _register(
      String nombre, String email, String password) async* {
    try {
      final serialize = {
        "nombre": nombre,
        "email": email,
        "password": password,
      };
      final dataResponse = await authenticationRepository.register(serialize);
      if (dataResponse.success!) {
        LocalStorage().userToken = (dataResponse.content!.token!);
        yield Success().copyWith(
          state: state,
          user: dataResponse.content,
          react: REACT_AUTHENTICATION.getSuccess,
        );
      } else {
        switch (dataResponse.error!.message!) {
          case "User no exist":
            yield Issue().copyWith(
              state: state,
              react: REACT_AUTHENTICATION.getErrorEmailNoExist,
            );
            break;
        }
      }
    } catch (Exception) {
      yield Issue().copyWith(
        state: state,
        react: REACT_AUTHENTICATION.getError,
      );
    }
  }
}
