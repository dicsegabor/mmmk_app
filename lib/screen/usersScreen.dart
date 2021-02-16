import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/searchableListScreen.dart';
import 'package:mmmk_app/widget/userItem.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = "users";

  @override
  Widget build(BuildContext context) {
    return SearchableListScreen(
      title: "Tagok",
      list: Provider.of<Repository>(context).users,
      listItemBuilder: (data) => UserItem(data),
      onRefresh: () => Provider.of<Repository>(context, listen: false).fetchAndSetUsers(
          BlocProvider.of<AuthenticationBloc>(context, listen: false).currentUser.token),
    );
  }
}
