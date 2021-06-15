import 'package:flutter/material.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/widget/reservationItem.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  final Map<int, List<Reservation>> _reservations;

  CalendarView(this._reservations);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  ValueNotifier<List<Reservation>> _selectedReservations;

  DateTime _selectedDay;
  DateTime _focusedDay;
  DateTime _firstDay;
  DateTime _lastDay;

  @override
  void initState() {
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _firstDay =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    _lastDay = DateTime.now().add(Duration(days: 7 - DateTime.now().weekday));
    _selectedReservations = ValueNotifier(_getReservationsForDay(_selectedDay));

    super.initState();
  }

  bool _selectedDayPredicate(DateTime day) => isSameDay(_selectedDay, day);

  void _onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _selectedReservations.value = _getReservationsForDay(selectedDay);
    });
  }

  List<Reservation> _getReservationsForDay(DateTime day) =>
      widget._reservations[day.weekday] ?? [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          TableCalendar(
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: Theme.of(context).textTheme.bodyText1,
            ),
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
            locale: 'hu_HU',
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            selectedDayPredicate: _selectedDayPredicate,
            onDaySelected: _onSelectedDay,
            eventLoader: _getReservationsForDay,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ValueListenableBuilder<List<Reservation>>(
              valueListenable: _selectedReservations,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) => ReservationItem(
                          value[index],
                          key: ValueKey(value[index].url),
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
