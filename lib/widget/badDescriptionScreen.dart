import 'package:flutter/material.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';

class BandDescriptionScreen extends StatelessWidget {
  final String bandName;
  final String description;

  BandDescriptionScreen({this.bandName, this.description});

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: bandName,
      showDrawer: false,
      showUserButton: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
