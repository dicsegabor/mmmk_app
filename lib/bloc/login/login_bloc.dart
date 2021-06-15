import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmmk_app/api/authenticationApi.dart';
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
      try {
        final token = await login(event.username, event.password)
            .timeout(Duration(seconds: 10));
        authenticationBloc.add(LoggedIn(user: null, token: "Token $token"));
      } catch (error) {
        yield LoginFailure(message: error.toString());
        yield LoginInitial();
      }
    }
  }
}
