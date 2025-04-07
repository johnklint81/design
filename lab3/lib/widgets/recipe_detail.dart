import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe.dart';
import '../ui_controller.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              uiController.deselectRecipe();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 200, height: 200, child: recipe.image),
            Text(recipe.name),
          ],
        ),
      ),
    );
  }
}
