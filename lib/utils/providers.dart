import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class GroupProvider extends ChangeNotifier {
  String groupName = "Standard";

  void changeGroup(String _groupName) {
    groupName = _groupName;
    notifyListeners();
  }
}
