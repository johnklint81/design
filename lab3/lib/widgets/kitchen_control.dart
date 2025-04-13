import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../util/cuisine.dart';
import '../model/recipe_database/recipe_handler.dart';

class KitchenControl extends StatelessWidget {
  const KitchenControl({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = Cuisine.labels;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Kök"),
        SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false,
          // Disables filtering (prevents typing)
          requestFocusOnTap: false,
          // Prevents keyboard from opening
          initialSelection: labels[0],
          // Starts with the first element selected
          dropdownMenuEntries: [
            for (int i = 0; i < labels.length; i++)
              DropdownMenuEntry(
                leadingIcon:
                    labels[i] == Cuisine.showAll
                        ? null
                        : Cuisine.flag(
                          labels[i],
                          width: AppTheme.paddingMedium,
                        ),
                value: labels[i],
                label: labels[i],
              ),
          ],
          onSelected: (value) {
            recipeHandler.setCuisine(value);
          },
        ),
      ],
    );
  }
}
