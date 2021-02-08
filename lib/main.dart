import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/screen/loadingScreen.dart';
import 'package:mmmk_app/screen/loginScreen.dart';
import 'package:mmmk_app/screen/reservationsScreen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, state) {
          if (state is AuthenticationUninitialized) return LoginScreen();
          if (state is AuthenticationUninitialized) return LoginScreen();
          if (state is AuthenticationAuthenticated) return ReservationsScreen();
          if (state is AuthenticationLoading)
            return LoadingScreen();
          else
            return LoadingScreen();
        },
      ),
    );
  }
}
