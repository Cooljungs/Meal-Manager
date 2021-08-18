import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupProvider extends ChangeNotifier {
  String selectedGroup = "";
  late SharedPreferences prefs;

  Future<void> initGroup() async {
    prefs = await SharedPreferences.getInstance();
    selectedGroup = prefs.getString("selectedGroup") ?? "";
    notifyListeners();
  }

  Future<void> setGroup(String groupName) async {
    prefs = await SharedPreferences.getInstance();
    selectedGroup = groupName;
    await prefs.setString("selectedGroup", groupName);
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

class ColorProvider extends ChangeNotifier {
  Color secondaryColor = Color(0xff4CAF50);
  int secondaryColorCode = 0xff4CAF50;
  late SharedPreferences prefs;

  List secondaryColorList = [
    0xFFeb3b5a,
    0xFFfa8231,
    0xFFf7b731,
    0xFF4caf50,
    0xFF2d98da,
    0xFF8854d0,
  ];

  Future<void> initColors() async {
    prefs = await SharedPreferences.getInstance();
    secondaryColorCode = prefs.getInt("secondaryColor") ?? 0xff4CAF50;
    secondaryColor = Color(secondaryColorCode);
    notifyListeners();
  }

  Future<void> setSecondaryColor(int colorCode) async {
    prefs = await SharedPreferences.getInstance();
    secondaryColorCode = colorCode;
    secondaryColor = Color(secondaryColorCode);
    await prefs.setInt("secondaryColor", colorCode);
    notifyListeners();
  }
}

class DisplayProvider extends ChangeNotifier {
  bool displayChat = false;
  late SharedPreferences prefs;

  Future<void> initDisplay() async {
    prefs = await SharedPreferences.getInstance();
    displayChat = prefs.getBool("displayChat") ?? false;
    notifyListeners();
  }

  Future<void> swapChat() async {
    prefs = await SharedPreferences.getInstance();
    displayChat = prefs.getBool("displayChat") ?? false;

    if (displayChat) {
      displayChat = false;
      await prefs.setBool("displayChat", false);
    } else {
      displayChat = true;
      await prefs.setBool("displayChat", true);
    }

    notifyListeners();
  }
}
