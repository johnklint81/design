import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../model/recipe_database/recipe_handler.dart';
import '../util/main_ingredient.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = MainIngredient.labels;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Ingrediens"),
        SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false,
          // Disables filtering (prevents typing)
          requestFocusOnTap: false,
          // Prevents keyboard from opening
          initialSelection: labels[0],
          dropdownMenuEntries: [
            for (int i = 0; i < labels.length; i++)
              DropdownMenuEntry(
                leadingIcon:
                    labels[i] == MainIngredient.showAll
                        ? null
                        : MainIngredient.icon(
                          labels[i],
                          width: AppTheme.paddingMedium,
                        ),

                value: labels[i],
                label: labels[i],
              ),
          ],
          onSelected: (value) {
            recipeHandler.setMainIngredient(value);
          },
        ),
      ],
    );
  }
}
