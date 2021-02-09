import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/repo/userRepository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository) : super(AuthenticationUninitialized());

  UserRepository get userRepository => _userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,) async* {
    if (event is AppStarted)
      yield AuthenticationUninitialized();
    if (event is LoggedIn) {
      //TODO: bejelentkezést megoldani, ha kész az api hozzá
      yield AuthenticationAuthenticated();
    }
    if (event is LoggedOut)
      yield AuthenticationUnauthenticated();
  }
}
