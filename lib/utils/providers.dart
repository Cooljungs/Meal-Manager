import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:provider/provider.dart';
import 'package:meal_manager/utils/.utilities.dart';

class GroupProvider extends ChangeNotifier {
  String groupName = "Standard";

  void setGroup(String _groupName) {
    groupName = _groupName;
    notifyListeners();
  }
}

class IndexProvider extends ChangeNotifier {
  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
