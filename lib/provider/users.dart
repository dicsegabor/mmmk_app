import 'package:flutter/material.dart';
import 'package:mmmk_app/model/user.dart';

class Users with ChangeNotifier {
  List<User> _items = [];

  List<User> get items => [..._items];

  // TODO: implement fetching
}
