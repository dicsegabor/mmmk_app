import 'package:flutter/material.dart';

class ExpandingListItem extends StatelessWidget {
  final String name;
  final String value;
  final Function onTap;

  const ExpandingListItem({
    @required this.name,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: ListTile(
            onTap: onTap == null
                ? null
                : () => onTap().catchError((error) => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.toString())))),
            leading: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Divider(height: 10),
      ],
    );
  }
}
