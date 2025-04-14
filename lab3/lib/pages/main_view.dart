import 'package:flutter/material.dart';
import 'package:lab3/widgets/difficulty_control.dart';
import 'package:lab3/widgets/ingredient_control.dart';
import 'package:lab3/widgets/kitchen_control.dart';
import 'package:lab3/widgets/price_control.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../ui_controller.dart';
import '../widgets/logo.dart';
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
      padding: const EdgeInsets.all(16), // optional but looks nicer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(alignment: Alignment.center, child: Logo()),
          const Text(
            'Hitta recept som passar genom att ändra '
            'inställningarna nedanför',
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(alignment: Alignment.centerRight, child: IngredientControl()),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(alignment: Alignment.centerRight, child: KitchenControl()),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Svårighetsgrad",
              style: AppTheme.smallHeading.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(alignment: Alignment.centerLeft, child: DifficultyControl()),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Maxpris:",
              style: AppTheme.smallHeading.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(alignment: Alignment.center, child: PriceControl()),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Maxtid:",
              style: AppTheme.smallHeading.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          Align(alignment: Alignment.center, child: TimeControl()),
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
