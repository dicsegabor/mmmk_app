import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/widget/bandItem.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';

import './screenTemplate.dart';

class BandsScreen extends StatefulWidget {
  static const routeName = "bands";

  @override
  _BandsScreenState createState() => _BandsScreenState();
}

class _BandsScreenState extends State<BandsScreen> {
  String _searchedText = "";
  List<Band> _bands = [];
  bool _isLoading = false;
  bool _isSearching = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() => _isLoading = true);
      _bands = BlocProvider.of<AuthenticationBloc>(context).repository.bands;
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  List<Band> get _filteredBands => _searchedText.isEmpty
      ? _bands
      : _bands.where((element) => element.contains(_searchedText)).toList();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Zenekarlista",
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
                itemCount: _filteredBands.length,
                itemBuilder: (context, index) =>
                    BandItem(_filteredBands[index]),
              ),
            ),
    );
  }
}
