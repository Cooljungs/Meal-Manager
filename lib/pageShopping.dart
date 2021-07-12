import 'package:flutter/material.dart';

Map zutaten = {
  "Tomaten (4 Stück)": "Chicken Shorba, Pizza",
  "Kokosmilch (1 L)": "Chicken Shorba",
  "Brokkoli (500g)": "Pizza",
  "Curry (4 EL)": "Chicken Shorba, Curry-Wurst",
  "Bratwüste (8 Stück)": "Curry-Wurst"
};

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: zutaten.length + 1,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Einkaufsliste",
                  style: Theme.of(context).textTheme.headline2,
                ),
              )
            : ShoppingTile(index, zutaten);
      },
    );
  }
}

class ShoppingTile extends StatefulWidget {
  final int index;
  final Map zutaten;
  const ShoppingTile(this.index, this.zutaten);

  @override
  ShoppingTileState createState() => ShoppingTileState();
}

class ShoppingTileState extends State<ShoppingTile> {
  bool? currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: CheckboxListTile(
        tileColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        value: currentValue,
        onChanged: (bool? value) {
          setState(() => currentValue = value!);
        },
        title: Text(widget.zutaten.keys.toList()[widget.index - 1]),
        subtitle: Text(widget.zutaten.values.toList()[widget.index - 1]),
      ),
    );
  }
}
