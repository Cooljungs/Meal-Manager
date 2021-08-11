import 'package:flutter/material.dart';
import 'package:meal_manager/widgets/recipes_card.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //
        appBar: AppBar(
          title: Text("Kochbuch"),
          actions: [
            IconButton(
              icon: Icon(Icons.post_add_rounded),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            tabs: [Tab(text: "Entdecken"), Tab(text: "Gespeichert")],
          ),
        ),
        //
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: BouncingScrollPhysics(),
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2 / 3),
              itemBuilder: (context, index) {
                return GridTile(child: RecipeCard(index));
              },
            ),
            Center(child: Text("Noch keine Rezepte gespeichert"))
          ],
        ),
      ),
    );
  }
}
