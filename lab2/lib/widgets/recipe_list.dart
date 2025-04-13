import 'package:flutter/material.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import '../ui_controller.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    var uiController = Provider.of<UIController>(context, listen: false);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        for (final recipe in recipes)
          RecipeListItem(
            recipe,
            onTap: () {
              uiController.selectRecipe(recipe);
            },
          ),
      ],
    );
  }
}
