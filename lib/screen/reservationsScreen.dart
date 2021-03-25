import 'package:flutter/material.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/reservationsList.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ReservationsScreen extends StatefulWidget {
  static const routeName = "reservations";

  @override
  _ReservationsScreenState createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  Map<Tab, int> _tabs = {};

  @override
  void initState() {
    // Getting the first day of the week
    DateTime startingWeekDay =
        DateTime.now().subtract(Duration(days: (DateTime.now().weekday - 1)));
    for (int i = 0; i < 7; i++) {
      // Iterating it
      DateTime weekDay = startingWeekDay.add(Duration(days: i));
      _tabs.putIfAbsent(
        Tab(text: DateFormat.E().format(weekDay).substring(0, 1)),
        () => weekDay.weekday,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Reservation> reservations =
        Provider.of<Repository>(context).reservations;

    List<List<Reservation>> dailyReservations = _tabs.values
        .map((weekDay) => reservations.where((e) => e.isOnThisWeekDay(weekDay)).toList())
        .toList();

    return DefaultTabController(
      initialIndex: DateTime.now().weekday - 1,
      length: _tabs.length,
      child: ScreenTemplate(
        appBar: AppBar(
          title: Text(
            "Foglalás",
            style: Theme.of(context).textTheme.headline1,
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            tabs: _tabs.keys.toList(),
          ),
        ),
        body: TabBarView(
          children: dailyReservations
              .map((element) => ReservationsList(element))
              .toList(),
        ),
      ),
    );
  }
}
