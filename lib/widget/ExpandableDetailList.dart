import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mmmk_app/widget/expandingListItem.dart';

class ExpandableDetailList extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget other;
  final bool otherLeading;
  final double otherHeight;
  final List<ExpandingListItem> infoList;

  const ExpandableDetailList({
    @required this.title,
    this.leading,
    this.other,
    this.otherLeading = true,
    this.otherHeight = 0,
    this.infoList,
  })  : assert(other != null ? otherHeight != 0 : true),
        assert(otherHeight >= 0);

  @override
  Widget build(BuildContext context) {
    infoList.removeWhere((e) => e.value == null || e.value.isEmpty);

    return Card(
      margin: EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      child: ExpandablePanel(
        header: ListTile(
          leading: leading,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        expanded: Container(
          height: (infoList.length * 50.0) + (other != null ? otherHeight : 0),
          child: Column(
            children: [
              if (other != null && otherLeading) other,
              if (infoList.isNotEmpty) ...infoList,
              if (other != null && !otherLeading) other
            ],
          ),
        ),
      ),
    );
  }
}
