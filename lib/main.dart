import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/bloc/login/login_bloc.dart';
import 'package:mmmk_app/repo/userRepository.dart';
import 'package:mmmk_app/screen/loadingScreen.dart';
import 'package:mmmk_app/screen/loginScreen.dart';
import 'package:mmmk_app/screen/reservationsScreen.dart';
import 'package:mmmk_app/screen/usersScreen.dart';

void main() {
  UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository)..add(AppStarted()),
      child: MyApp(),
    ),
  );
}

ThemeData generalTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: generalTheme.copyWith(brightness: Brightness.light),
      darkTheme: generalTheme.copyWith(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, state) {
          if (state is AuthenticationUninitialized || state is AuthenticationUnauthenticated)
            return BlocProvider(
              create: (context) =>
                  LoginBloc(BlocProvider.of<AuthenticationBloc>(context)),
              child: LoginScreen(),
            );
          if (state is AuthenticationAuthenticated) return ReservationsScreen();
          if (state is AuthenticationLoading)
            return LoadingScreen();
          else
            return LoadingScreen();
        },
      ),
      routes: {
        ReservationsScreen.routeName: (context) => ReservationsScreen(),
        UsersScreen.routeName: (context) => UsersScreen(),
      },
    );
  }
}
