import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:umami/providers/local-storage_provider.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationState(react: REACT_VALIDATION.initial));

  @override
  Stream<ValidationState> mapEventToState(
    ValidationEvent event,
  ) async* {
    if (event is ValidationLogin) {
      yield* _validationLogin();
    }
  }

  Stream<ValidationState> _validationLogin() async* {
    if (LocalStorage().userToken == "") {
      yield Success().copyWith(state: state, react: REACT_VALIDATION.login);
    } else {
      yield Success().copyWith(state: state, react: REACT_VALIDATION.home);
    }
  }
}
