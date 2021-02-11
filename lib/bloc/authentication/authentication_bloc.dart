import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmmk_app/model/apiModel.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/repo/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  Repository _repository;
  ApiUser _currentUser;

  AuthenticationBloc(this._repository) : super(AuthenticationUninitialized());

  Repository get repository => _repository;
  ApiUser get currentUser => _currentUser;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,) async* {
    if (event is AppStarted)
      yield AuthenticationUninitialized();
    if (event is LoggedIn) {
      //TODO: bejelentkezést megoldani, ha kész az api hozzá
      await _repository.fetchAndSetData("");
      yield AuthenticationAuthenticated();
    }
    if (event is LoggedOut)
      yield AuthenticationUnauthenticated();
  }
}
