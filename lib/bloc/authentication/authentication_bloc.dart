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

  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    _repository = Repository();
  }

  Repository get repository => _repository;

  ApiUser get currentUser => _currentUser;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) yield AuthenticationUninitialized();
    if (event is LoggedIn) {
      try {
        _currentUser = ApiUser("admin", Token(event.token, Duration(hours: 1)));
        await _repository
            .fetchAndSetAllData(_currentUser.token)
            .timeout(Duration(seconds: 5));
        yield AuthenticationAuthenticated();
      } catch (error) {
        print(error);
      }
    }
    if (event is LoggedOut) yield AuthenticationUnauthenticated();
  }
}
