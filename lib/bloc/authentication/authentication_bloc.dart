import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mmmk_app/model/apiModel.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/widget/dialogs/errorDialog.dart';

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
      //TODO: bejelentkezést megoldani, ha kész az api hozzá
      try {
        _currentUser = ApiUser("admin", Token("", Duration(hours: 1)));
        await _repository
            .fetchAndSetAllData(_currentUser.token)
            .timeout(Duration(seconds: 10));
        yield AuthenticationAuthenticated();
      } catch (error) {
        print(error);
        //TODO: ezt innen kivenni
        yield AuthenticationAuthenticated();
      }
    }
    if (event is LoggedOut) yield AuthenticationUnauthenticated();
  }
}
