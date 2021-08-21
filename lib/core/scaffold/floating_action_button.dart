import 'package:flutter/material.dart';
import 'package:meal_manager/screens/main_screens/recipes.dart';
import 'package:meal_manager/utils/teleport.dart';

class ScaffoldFloatingActionButton extends StatefulWidget {
  const ScaffoldFloatingActionButton({Key? key}) : super(key: key);

  @override
  _ScaffoldFloatingActionButtonState createState() =>
      _ScaffoldFloatingActionButtonState();
}

class _ScaffoldFloatingActionButtonState
    extends State<ScaffoldFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(Icons.restaurant_rounded),
      onPressed: () {
        Navigator.push(
            context, Teleport(child: Recipes(), type: "scale_bottomRight"));
      },
    );
  }
}
