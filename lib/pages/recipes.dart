import 'package:flutter/material.dart';
import '/components/recipes_Card.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kochbuch"), elevation: 0),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 3),
          itemBuilder: (context, index) {
            return GridTile(child: RecipeCard(index));
          },
        ),
      ),
    );
  }
}
