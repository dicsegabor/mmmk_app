import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mmmk_app/functions/generalFunctions.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/widget/badDescriptionScreen.dart';
import 'package:mmmk_app/widget/dialogs/infoDialog.dart';
import 'package:mmmk_app/widget/expandableDetailList.dart';
import 'package:mmmk_app/widget/expandingListItem.dart';

class BandItem extends StatelessWidget {
  final Band _band;

  BandItem(this._band);

  Widget _buildMembersDetail(double height) {
    return Container(
      key: ValueKey(_band.name),
      height: height,
      child: Column(
        children: [
          Text(
            "Tagok",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(height: 10),
          if (_band.members != null && _band.members.isNotEmpty)
            Container(
              child: _buildDoubleColumn(_band.members),
            ),
          Divider(height: 10),
        ],
      ),
    );
  }

  // TODO: esetleg átírni gridview-ra
  Widget _buildDoubleColumn(List<String> data) {
    List<Widget> left = [];
    List<Widget> right = [];

    for (int i = 0; i < data.length; i++) {
      Widget text = Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Text(
          data[i],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      );
      i % 2 == 0 ? left.add(text) : right.add(text);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [...left],
        ),
        Column(
          children: [...right],
        ),
      ],
    );
  }

  Future<Widget> _getBandLogo(BuildContext context) async {
    String url = _band.logoUrl;

    try {
      if (url == null || url.isEmpty) throw Exception("Nincs megadott url!");
      if (await testUrl(url))
        return CircleAvatar(backgroundImage: NetworkImage(url));
    } catch (error) {
      // print(error.toString());
    }
    return CircleAvatar(
      child: Text(
        _band.name.substring(0, 1).toUpperCase(),
        style: Theme.of(context).textTheme.headline2,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Cím + 2 divider + tagok
    double membersDetailHeight = 40 + (_band.members.length / 2) * 26.0;

    return FutureBuilder(
      future: _getBandLogo(context),
      builder: (context, dataSnapshot) => ExpandableDetailList(
        leading: dataSnapshot.connectionState == ConnectionState.waiting
            ? CircularProgressIndicator()
            : dataSnapshot.data,
        title: _band.name,
        other: _buildMembersDetail(membersDetailHeight),
        otherHeight: membersDetailHeight,
        infoList: [
          ExpandingListItem(
            name: "E-mail",
            value: _band.contactEmail,
            onTap: () => sendEmail(_band.contactEmail),
          ),
          ExpandingListItem(
            name: "Weboldal",
            value: "Tovább a weboldalra",
            onTap: () => goToWebsite(_band.website),
          ),
          ExpandingListItem(
            name: "Leírás",
            value: "Tovább a leíráshoz",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => BandDescriptionScreen(
                        bandName: _band.name,
                        description: _band.description,
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
