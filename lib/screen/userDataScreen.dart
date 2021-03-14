import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/changePasswordForm.dart';
import 'package:mmmk_app/widget/changeEmailForm.dart';
import 'package:mmmk_app/widget/editUserDataForm.dart';
import 'package:mmmk_app/widget/userStatusIndicator.dart';
import 'package:provider/provider.dart';

class UserDataScreen extends StatelessWidget {
  static const routeName = "userData";

  User getCurrentUser(BuildContext context) {
    return Provider.of<Repository>(context).getUserByUsername(
        BlocProvider.of<AuthenticationBloc>(context).currentUser.username);
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = getCurrentUser(context);

    Map<Tab, Widget> tabs = {
      Tab(icon: Icon(Icons.account_circle)): EditUserDataForm(currentUser),
      Tab(icon: Icon(Icons.alternate_email)): ChangeEmailForm(currentUser),
      Tab(icon: Icon(Icons.security)): ChangePasswordForm(currentUser),
    };

    return DefaultTabController(
      length: tabs.length,
      child: ScreenTemplate(
        appBar: AppBar(
          title: Text(
            "Felhasználói adatok",
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [UserStatusIndicator(currentUser)],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            tabs: tabs.keys.toList(),
          ),
        ),
        showDrawer: false,
        body: TabBarView(
          children: tabs.values.toList(),
        ),
      ),
    );
  }
}
