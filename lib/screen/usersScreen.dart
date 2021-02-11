import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';
import 'package:mmmk_app/widget/userItem.dart';

import './screenTemplate.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = "users";

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _searchedText = "";
  List<User> _users = [];
  bool _isLoading = false;
  bool _isSearching = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() => _isLoading = true);
      _users = BlocProvider.of<AuthenticationBloc>(context).repository.users;
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  List<User> get _filteredUsers => _searchedText.isEmpty
      ? _users
      : _users.where((element) => element.contains(_searchedText)).toList();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Taglista",
      appBar: _isSearching
          ? AppBar(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Keresés"),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => setState(() => (_searchedText = value)),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _searchedText = "";
                    setState(() => _isSearching = false);
                  },
                ),
              ],
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => setState(() => _isSearching = true),
        ),
      ],
      body: _isLoading
          ? LoadingWidget()
          : Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) =>
                    UserItem(_filteredUsers[index]),
              ),
            ),
    );
  }
}
