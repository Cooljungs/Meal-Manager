import 'package:flutter/material.dart';
import 'package:meal_manager/utils/providers.dart';
import 'package:provider/provider.dart';

class ScaffoldBottomNavigationBar extends StatefulWidget {
  const ScaffoldBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _ScaffoldBottomNavigationBarState createState() =>
      _ScaffoldBottomNavigationBarState();
}

class _ScaffoldBottomNavigationBarState
    extends State<ScaffoldBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Provider.of<IndexProvider>(context).currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels:
          Provider.of<IndexProvider>(context).currentIndex == 2 ? false : false,
      onTap: (index) => Provider.of<IndexProvider>(context, listen: false).setIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Haushalt",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_rounded),
          label: "Wochenplan",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen_rounded),
          label: "Kühlschrank",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_rounded),
          label: "Einkaufsliste",
          tooltip: "",
        ),
      ],
    );
  }
}
