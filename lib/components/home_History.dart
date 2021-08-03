import 'package:flutter/material.dart';

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
          return HistoryCard(index);
        },
      ),
    );
  }
}

class HistoryCard extends StatefulWidget {
  final int index;
  const HistoryCard(this.index);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.index == 0
          ? EdgeInsets.fromLTRB(16, 16, 16, 32)
          : EdgeInsets.fromLTRB(0, 16, 16, 32),
      width: 230,
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
                child: Image.asset(
                    "assets/images/recipes/Rezept_Pfannkuchen.jpg",
                    fit: BoxFit.fitWidth),
              ),
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
                Container(
                    width: 140,
                    height: 32,
                    child: TextButton(
                        onPressed: () {}, child: Text("Vorschlagen"))),
                IconButton(
                    onPressed: () => setState(() => liked = !liked),
                    icon: liked
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border_rounded))
              ],
            ),
          )
        ],
      ),
    );
  }
}
