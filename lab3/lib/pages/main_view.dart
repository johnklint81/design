import 'package:flutter/material.dart';
import 'package:lab3/widgets/difficulty_control.dart';
import 'package:lab3/widgets/ingredient_control.dart';
import 'package:lab3/widgets/kitchen_control.dart';
import 'package:lab3/widgets/price_control.dart';
import 'package:provider/provider.dart';

import '../ui_controller.dart';
import '../widgets/recipe_detail.dart';
import '../widgets/recipe_list.dart';
import '../widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), const RecipeArea()]),
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      padding: const EdgeInsets.all(16), // optional but looks nicer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
          alignment: Alignment.center,
          child: const Text("Receptsök"),
          ),
          const Text(
            'Hitta recept som passar genom att ändra '
                'inställningarna nedanför',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IngredientControl(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: KitchenControl(),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text("Svårighetsgrad"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: DifficultyControl(),
          ),
          Align(
            alignment: Alignment.center,
            child: PriceControl(),
          ),
          Align(
            alignment: Alignment.center,
            child: TimeControl(),
          ),
        ],
      ),
    );
  }

}

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
      contents = RecipeList();
    } else {
      contents = RecipeDetail(uiController.selectedRecipe!);
    }
    return Expanded(child: contents);
  }
}
