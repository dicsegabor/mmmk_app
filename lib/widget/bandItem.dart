import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mmmk_app/model/band.dart';

class BandItem extends StatelessWidget {
  final Band _band;

  const BandItem(this._band);

  // TODO: description részt hozzáadni
  List<Widget> _buildExpanding(BuildContext context) {
    return [
      _buildMembersDetail(title: "Tagok", members: _band.members),
      if (_band.contactEmail != null && _band.contactEmail.isNotEmpty)
        _buildBandDetail(
          context: context,
          name: "E-mail",
          value: _band.contactEmail,
          onTap: _band.sendEmail,
        ),
      if (_band.website != null && _band.website.isNotEmpty)
        _buildBandDetail(
          context: context,
          name: "Weboldal",
          value: "Tovább a weboldalra",
          onTap: _band.goToWebsite,
        ),
    ];
  }

  Widget _buildMembersDetail({String title, List<String> members}) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        if (members != null && members.isNotEmpty)
          Container(
            height: members.length * 29.0,
            child: Column(
              children: members
                  .map(
                    (member) => Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        member,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        Divider(),
      ],
    );
  }

  Widget _buildBandDetail(
          {BuildContext context, String name, String value, Function onTap}) =>
      Column(
        children: [
          Container(
            height: 40,
            child: ListTile(
              onTap: () => onTap().catchError((error) => Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(error.toString())))),
              leading: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(value),
            ),
          ),
          Divider(height: 10),
        ],
      );

  Widget _getBandLogo({BuildContext context, String logoUrl}) {
    RegExp regExp = RegExp(r"(https?:\/\/.*\.(?:png|jpg|jpeg|gif|tiff))");
    Iterable<Match> matches = regExp.allMatches(logoUrl);

    if (matches.isNotEmpty)
      return CircleAvatar(backgroundImage: NetworkImage(logoUrl));
    else
      return CircleAvatar(
        child: Text(
          _band.name.substring(0, 1),
          style: Theme.of(context).textTheme.headline2,
        ),
        backgroundColor: Theme
            .of(context)
            .accentColor,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      child: ExpandablePanel(
        header: ListTile(
          leading: _getBandLogo(
            context: context,
            logoUrl: _band.logoUrl,
          ),
          title: Text(
            _band.name,
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
        ),
        expanded: Container(
          height: (_band.members.length * 29.0) +
              35 +
              (_buildExpanding(context).length - 1) * 50,
          child: Column(
            children: _buildExpanding(context),
          ),
        ),
      ),
    );
  }
}
