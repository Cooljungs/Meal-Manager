import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/utils/providers.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
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
          children: List.generate(
              Provider.of<ShoppingProvider>(context).zutaten.length, (index) {
            return Provider.of<ShoppingProvider>(context).zutaten[index][3] ==
                    false
                ? ShoppingTile(index)
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
                  children: List.generate(
                      Provider.of<ShoppingProvider>(context).zutaten.length,
                      (index) {
                    return Provider.of<ShoppingProvider>(context).zutaten[index]
                                [3] ==
                            true
                        ? ShoppingTile(index)
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
  const ShoppingTile(this.index);

  @override
  ShoppingTileState createState() => ShoppingTileState();
}

class ShoppingTileState extends State<ShoppingTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: ListTile(
        onTap: () => Provider.of<ShoppingProvider>(context, listen: false)
            .changeStatus(widget.index),
        tileColor: Provider.of<ShoppingProvider>(context).zutaten[widget.index]
                [3]
            ? Theme.of(context).disabledColor
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing: Provider.of<ShoppingProvider>(context).zutaten[widget.index]
                [3]
            ? Icon(Icons.task_alt_outlined,
                color: Theme.of(context).colorScheme.onPrimary)
            : Icon(Icons.radio_button_unchecked_rounded,
                color: Theme.of(context).colorScheme.onPrimary),
        title: Text(
            Provider.of<ShoppingProvider>(context).zutaten[widget.index][0]),
        subtitle: Text(
            Provider.of<ShoppingProvider>(context).zutaten[widget.index][2]),
      ),
    );
  }
}
