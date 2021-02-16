import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/bloc/login/login_bloc.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/bandsScreen.dart';
import 'package:mmmk_app/screen/loadingScreen.dart';
import 'package:mmmk_app/screen/loginScreen.dart';
import 'package:mmmk_app/screen/reservationsScreen.dart';
import 'package:mmmk_app/screen/searchableListScreen.dart';
import 'package:mmmk_app/screen/usersScreen.dart';
import 'package:mmmk_app/widget/bandItem.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MyApp(),
    ),
  );
}

ThemeData generalTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(fontSize: 16),
  ),
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
    return ChangeNotifierProvider.value(
      value: BlocProvider.of<AuthenticationBloc>(context).repository,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: generalTheme.copyWith(brightness: Brightness.light),
        darkTheme: generalTheme.copyWith(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, state) {
            if (state is AuthenticationUninitialized ||
                state is AuthenticationUnauthenticated)
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
          BandsScreen.routeName: (context) => BandsScreen(),
        },
      ),
    );
  }
}
