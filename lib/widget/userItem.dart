import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mmmk_app/model/user.dart';

class UserItem extends StatelessWidget {
  final User _user;

  const UserItem(this._user);

  List<Widget> _buildExpanding(BuildContext context) {
    return [
      _buildMemberDetail(
        context: context,
        name: "Email",
        value: _user.email,
        onTap: _user.sendEmail,
      ),
      _buildMemberDetail(
        context: context,
        name: "Telefon",
        value: _user.profile.telephone,
        onTap: _user.callPhone,
      ),
      _buildMemberDetail(
        context: context,
        name: "Kollégium",
        value: _user.profile.dormitory,
      ),
      _buildMemberDetail(
        context: context,
        name: "Szoba",
        value: _user.profile.room.toString(),
      ),
      /*if (_user.groups != null && _user.groups.isNotEmpty)
        _buildMemberDetail(
          context: context,
          name: "Zenekarok",
          value: "",
        ),*/
    ];
  }

  Widget _buildMemberDetail({
    BuildContext context,
    String name,
    String value,
    Function onTap,
  }) =>
      Column(
        children: [
          Container(
            height: 40,
            child: ListTile(
              onTap: () => onTap().catchError((error) => Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(error.toString())))),
              leading: Text(name),
              trailing: Text(value),
            ),
          ),
          Divider(height: 10),
        ],
      );

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
          title: Text(
            "${_user.fullName} (${_user.username})",
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
        ),
        expanded: Container(
          height: _buildExpanding(context).length * 50.0,
          child: Column(
            children: _buildExpanding(context),
          ),
        ),
      ),
    );
  }
}
