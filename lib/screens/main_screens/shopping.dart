import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List zutaten = [
    ["Tomaten", "4 Stück", "Chicken Shorba, Pizza", true],
    ["Brokkoli", "500g", "Pizza", false],
    ["Erdbeeren", "100g", "Erdbeer-Smoothie", false],
    ["Paprika", "5 Stück", "Bolognese, Gefüllte Paprika, Pizza", true],
    ["Nudeln", "250g", "Bolognese", false],
    ["Hackfleisch", "420g", "Gefüllte Paprika", true],
    ["Basilikum", "1 Stück", "Bolognese, Chicken Shorba, Pizza", true],
  ];

  void toggleCheck(int index) {
    setState(() => zutaten[index][3] == true
        ? zutaten[index][3] = false
        : zutaten[index][3] = true);
  }

  bool doneExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Einkaufsliste",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Column(
          children: List.generate(zutaten.length, (index) {
            return zutaten[index][3] == false
                ? ShoppingTile(index, zutaten, () => toggleCheck(index))
                : Container();
          }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
          child: TextButton(
            onPressed: () => setState(() => doneExpanded = !doneExpanded),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: Colors.transparent,
            ),
            child: Row(
              children: [
                Text(
                  "Erledigt",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Icon(
                  doneExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).accentColor,
                  size: 32,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: doneExpanded
              ? Column(
                  children: List.generate(zutaten.length, (index) {
                    return zutaten[index][3] == true
                        ? ShoppingTile(index, zutaten, () => toggleCheck(index))
                        : Container();
                  }),
                )
              : null,
        )
      ],
    );
  }
}

class ShoppingTile extends StatefulWidget {
  final int index;
  final List zutaten;
  final Function toggleCheck;
  const ShoppingTile(this.index, this.zutaten, this.toggleCheck);

  @override
  ShoppingTileState createState() => ShoppingTileState();
}

class ShoppingTileState extends State<ShoppingTile> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: ListTile(
        onTap: () {
          widget.toggleCheck(widget.index);
        },
        tileColor: widget.zutaten[widget.index][3]
            ? Theme.of(context).disabledColor
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing: widget.zutaten[widget.index][3]
            ? Icon(Icons.task_alt_outlined, color: Colors.black)
            : Icon(Icons.radio_button_unchecked_rounded, color: Colors.black),
        title: Text(widget.zutaten[widget.index][0]),
        subtitle: Text(widget.zutaten[widget.index][2]),
      ),
    );
  }
}
