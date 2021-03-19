import 'package:flutter/material.dart';

enum DialogResult {
  YES,
  NO,
}

class YesNoDialog {
  final String title;
  final String content;

  YesNoDialog({
    this.title = "",
    this.content = "",
  });

  Future<DialogResult> show(BuildContext context) {
    return showDialog<DialogResult>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: content.isEmpty ? null : Text(content),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(DialogResult.YES),
            child: Text("Igen"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(DialogResult.NO),
            child: Text("Nem"),
          ),
        ],
      ),
    );
  }
}
