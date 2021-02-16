import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/searchableListScreen.dart';
import 'package:mmmk_app/widget/bandItem.dart';
import 'package:provider/provider.dart';

class BandsScreen extends StatelessWidget {
  static const routeName = "bands";

  @override
  Widget build(BuildContext context) {
    return SearchableListScreen(
      title: "Zenekarok",
      list: Provider.of<Repository>(context).bands,
      listItemBuilder: (data) => BandItem(data),
      onRefresh: () => Provider.of<Repository>(context, listen: false).fetchAndSetBands(
          BlocProvider.of<AuthenticationBloc>(context, listen: false).currentUser.token),
    );
  }
}
