import 'package:flutter/material.dart';
import 'package:mmmk_app/functions/generalFunctions.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/widget/ExpandableDetailList.dart';
import 'package:mmmk_app/widget/dialogs/infoDialog.dart';
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
              fontSize: 16,
            ),
          ),
          if (_band.members != null && _band.members.isNotEmpty)
            Container(
              child: _buildDoubleColumn(_band.members),
            ),
          Divider(),
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
      ),
    );
  }

  Widget _getBandLogo(BuildContext context) {
    // Url matcher
    //RegExp regExp = RegExp(r"(https?:\/\/.*\.(?:png|jpg|jpeg|gif|tiff))");
    //Iterable<Match> matches = regExp.allMatches(_band.logoUrl);

    try {
      if (_band.logoUrl == null || _band.logoUrl.isEmpty) throw Exception();
      return CircleAvatar(backgroundImage: NetworkImage(_band.logoUrl));
    } catch (error) {
      return CircleAvatar(
        child: Text(
          _band.name.substring(0, 1).toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double membersDetailHeight = (_band.members.length / 2) * 35.0;

    return ExpandableDetailList(
      leading: _getBandLogo(context),
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
          onTap: () => InfoDialog(
            title: "Leírás",
            content: _band.description,
          ).show(context),
        ),
      ],
    );
  }
}
