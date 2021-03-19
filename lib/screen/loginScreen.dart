import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/login/login_bloc.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';
import 'package:mmmk_app/widget/loginForm.dart';

import '../widget/dialogs/errorDialog.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Bejelentkezés",
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (BuildContext context, state) {
          if (state is LoginInitial) return LoginForm(); // LoginForm
          return LoadingWidget();
        },
        listener: (BuildContext context, state) async {
          if (state is LoginFailure) {
            ErrorDialog(content: state.message).show(context);
          }
        },
      ),
      showDrawer: false,
      showUserButton: false,
    );
  }
}
