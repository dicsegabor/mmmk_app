import 'package:flutter/material.dart';
import 'package:mmmk_app/functions/generalFunctions.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/widget/ExpandableDetailList.dart';
import 'package:mmmk_app/widget/expandingListItem.dart';

class UserItem extends StatelessWidget {
  final User _user;

  const UserItem(this._user);

  @override
  Widget build(BuildContext context) {
    return ExpandableDetailList(
      title: "${_user.fullName} (${_user.username})",
      infoList: [
        ExpandingListItem(
          name: "Email",
          value: _user.email,
          onTap: () => sendEmail(_user.email),
        ),
        ExpandingListItem(
          name: "Telefon",
          value: _user.profile.telephone,
          onTap: () => callPhone(_user.profile.telephone),
        ),
        ExpandingListItem(
          name: "Kollégium",
          value: _user.profile.dormitory,
        ),
        ExpandingListItem(
          name: "Szoba",
          value: _user.profile.room.toString(),
        ),
      ],
    );
  }
}
