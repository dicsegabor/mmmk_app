import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.authenticationBloc) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      // TODO: csak teszthez kellett
      await Future.delayed(const Duration(seconds: 2), () => "2");
      try {
        //TODO: bejelentkezést megoldani, ha kész az api hozzá
        //await login(event.username, event.password);
        authenticationBloc.add(LoggedIn(user: null));
      } catch (error) {
        yield LoginFailure(message: error.message);
        yield LoginInitial();
      }
    }
  }
}
