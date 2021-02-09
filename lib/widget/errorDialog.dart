import 'package:flutter/material.dart';

class ErrorDialog {
  final String title;
  final String content;

  ErrorDialog({
    this.title = "Hiba történt",
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
            child: Text("Rendben"),
          ),
        ],
      ),
    );
  }
}
