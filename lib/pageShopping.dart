import 'package:flutter/material.dart';

List zutaten = [
  ["Tomaten", "4 Stück", "Chicken Shorba, Pizza", true],
  ["Brokkoli", "500g", "Pizza", false]
];

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
  final List zutaten;
  const ShoppingTile(this.index, this.zutaten);

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
          setState(() => widget.zutaten[widget.index - 1][3]
              ? widget.zutaten[widget.index - 1][3] = false
              : widget.zutaten[widget.index - 1][3] = true);
        },
        tileColor: widget.zutaten[widget.index - 1][3]
            ? Theme.of(context).disabledColor
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing: widget.zutaten[widget.index - 1][3]
            ? Icon(Icons.task_alt_outlined, color: Colors.black)
            : Icon(Icons.radio_button_unchecked_rounded, color: Colors.black),
        title: Text(widget.zutaten[widget.index - 1][0]),
        subtitle: Text(widget.zutaten[widget.index - 1][2]),
      ),
    );
  }
}
