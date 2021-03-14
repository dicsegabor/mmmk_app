import 'package:flutter/material.dart';
import 'package:mmmk_app/model/user.dart';
import 'package:mmmk_app/widget/dialogs/yesNoDialog.dart';

enum PeriodState {
  PASSIVE,
  PENDING,
  ACTIVE,
}

class UserStatusIndicator extends StatefulWidget {
  final User _currentUser;

  UserStatusIndicator(this._currentUser);

  @override
  _UserStatusIndicatorState createState() => _UserStatusIndicatorState();
}

class _UserStatusIndicatorState extends State<UserStatusIndicator> {
  PeriodState _periodState;

  @override
  initState() {
    _getPeriodState();
    super.initState();
  }

  void _getPeriodState() {
    PeriodState ps = PeriodState.PASSIVE;
    if(widget._currentUser.profile.firstReservation)
      ps = PeriodState.PENDING;
    else
      ps = PeriodState.ACTIVE;
    //TODO: only for testing, remove when done
    ps = PeriodState.PASSIVE;
    setState(() => _periodState = ps);
  }

  Widget _buildPeriodStateButton({Function onPressed, Icon icon}) {
    return IconButton(
      splashRadius: 35,
      onPressed: onPressed,
      iconSize: 40,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_periodState) {
      case PeriodState.PASSIVE:
        return _buildPeriodStateButton(
          // TODO: Időszakra jelentkezés megoldása
          onPressed: () => YesNoDialog(
            title: "Figyelem!",
            content: "Biztosan jelentkezel az időszakra?",
          ).show(context).then((result) {
            if (result == DialogResult.YES)
              setState(() => _periodState = PeriodState.PENDING);
          }),
          icon: Icon(
            Icons.description,
            color: Theme.of(context).errorColor,
          ),
        );
      case PeriodState.PENDING:
        return _buildPeriodStateButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("A jelentkezésed elfogadásra vár."),
              duration: Duration(seconds: 2),
            ));
            setState(() => _periodState = PeriodState.ACTIVE);
          },
          icon: Icon(
            Icons.watch_later,
            color: Colors.blue,
          ),
        );
      case PeriodState.ACTIVE:
        return _buildPeriodStateButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("A jelentkezésed elfogadtuk."),
              duration: Duration(seconds: 2),
            ));
            setState(() => _periodState = null);
          },
          icon: Icon(
            Icons.done,
            color: Colors.green,
          ),
        );
      default:
        return _buildPeriodStateButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Sajnos nem tudtuk lekérdezni a státuszodat."),
              duration: Duration(seconds: 2),
            ));
            setState(() => _periodState = PeriodState.PASSIVE);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).errorColor,
          ),
        );
    }
  }
}
