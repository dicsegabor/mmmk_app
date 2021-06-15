import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mmmk_app/functions/generalFunctions.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/widget/expandableDetailList.dart';
import 'package:mmmk_app/widget/expandingListItem.dart';

class ReservationItem extends StatelessWidget {
  final Reservation _reservation;

  ReservationItem(this._reservation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableDetailList(
      title: '${DateFormat.Hm().format(_reservation.timeRange.start)} - ' +
          '${DateFormat.Hm().format(_reservation.timeRange.end)}',
      leading: CircleAvatar(
        backgroundColor: _reservation.color,
        child: Text(
          _reservation.title.substring(0, 1).toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      infoList: [
        ExpandingListItem(
          name: 'Foglaló',
          value: _reservation.title,
        ),
        ExpandingListItem(
          name: 'Beengedő',
          value: _reservation.admissioner != null
              ? _reservation.admissioner.fullName
              : 'Még nincs beengedő',
        ),
      ],
      other: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_reservation.admissioner == null)
              ElevatedButton(
                // TODO: implement pinging admissioners
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('A beengedőket értesítettük'))),
                child: Text('Beengedő kérése'),
              ),
            if (_reservation.admissioner != null)
              ElevatedButton(
                onPressed: () =>
                    callPhone(_reservation.admissioner.profile.telephone),
                child: Text('Beengedő hívása'),
              ),
          ],
        ),
      ),
      otherHeight: 66,
    );
  }
}
