import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final int index;
  const RecipeCard(this.index);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                          "assets/images/recipes/Rezept_ChickenShorba.png",
                          fit: BoxFit.fitWidth),
                      Positioned.fill(
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(onTap: () {})))
                    ],
                  )),
            ),
          ),
          ListTile(
            title: Text("Chicken Shorba"),
            contentPadding: EdgeInsets.only(left: 16),
            minVerticalPadding: 0,
            subtitle: Row(
              children: [
                Icon(Icons.star_rounded, size: 18, color: Colors.yellow[700]),
                Icon(Icons.star_rounded, size: 18, color: Colors.yellow[700]),
                Icon(Icons.star_rounded, size: 18, color: Colors.yellow[700]),
                Icon(Icons.star_rounded, size: 18, color: Colors.yellow[700]),
                Icon(Icons.star_outline_rounded,
                    size: 18, color: Colors.yellow[700]),
                SizedBox(width: 8),
                Text("1337")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text("Vorschlagen"),
                    ),
                  ),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => setState(() => liked = !liked),
                      icon: liked
                          ? Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border_rounded)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
