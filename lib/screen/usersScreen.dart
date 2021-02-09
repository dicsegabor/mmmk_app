import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/api/usersApi.dart' as usersApi;
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';
import 'package:mmmk_app/widget/userItem.dart';

import './screenTemplate.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = "users";

  @override
  Widget build(BuildContext context) {
    //TODO: keresést implementálni

    return ScreenTemplate(
      title: "Taglista",
      body: FutureBuilder(
        future: usersApi.fetchUsers(BlocProvider.of<AuthenticationBloc>(
          context,
          listen: false,
        ).userRepository.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          if (snapshot.hasError)
            //TODO: normális hibakezelés
            return Center(child: Text("Hiba történt"));
          else
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    UserItem(snapshot.data[index]),
              ),
            );
        },
      ),
    );
  }
}
