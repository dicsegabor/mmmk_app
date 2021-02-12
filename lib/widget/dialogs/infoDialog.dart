import 'package:flutter/material.dart';

class InfoDialog {
  final String title;
  final String content;

  InfoDialog({
    this.title = "Információ",
    this.content = "",
  });

  Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: content.isEmpty ? null : Text(content),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
