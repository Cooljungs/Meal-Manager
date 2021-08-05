import 'package:flutter/material.dart';
import '/components/recipes_Card.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Kochbuch"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.pink,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GridTile(child: RecipeCard(index));
          },
        ),
      ),
    );
  }
}
