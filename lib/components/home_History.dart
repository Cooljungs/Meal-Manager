import 'package:flutter/material.dart';

import '/components/recipes_Card.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
              margin: index == 0
                  ? EdgeInsets.fromLTRB(16, 16, 16, 32)
                  : EdgeInsets.fromLTRB(0, 16, 16, 32),
              child: RecipeCard(index));
        },
      ),
    );
  }
}
