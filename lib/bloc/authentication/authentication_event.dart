part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final User user;
  final String token;

  const LoggedIn({@required this.user, @required this.token});
}

class LoggedOut extends AuthenticationEvent {}

class Logout extends AuthenticationEvent {


  
}
