import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../model/recipe_database/recipe.dart';
import '../ui_controller.dart';
import '../util/cuisine.dart';
import '../util/difficulty.dart';
import '../util/main_ingredient.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            surfaceTintColor:
                Theme.of(context).colorScheme.surfaceTint, // match Card's tint
            elevation: 4,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  uiController.deselectRecipe();
                },
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 240, maxWidth: 240),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingMedium),
                      child: Container(
                        width: 240,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image: recipe.image.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: AppTheme.paddingSmall,
                                right: AppTheme.paddingSmall,
                                child: Cuisine.flag(recipe.cuisine, width: AppTheme.paddingHuge)!,
                              ),
                            ],  // Children
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: AppTheme.paddingSmall,
                              left: AppTheme.paddingMedium,
                              right: AppTheme.paddingMedium,
                            ),
                            child: Text(
                              "Ingredienser",
                              style: AppTheme.smallHeading,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: AppTheme.paddingSmall,
                              left: AppTheme.paddingMedium,
                              right: AppTheme.paddingMedium,
                            ),
                            child: Text(
                              "${recipe.servings} portioner",
                              style: AppTheme.smallText,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: AppTheme.paddingSmall,
                              left: AppTheme.paddingLarge,
                              right: AppTheme.paddingMedium,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...recipe.ingredients.map((item) =>
                                    Text("• $item", style: AppTheme.smallText),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.largeHeading),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MainIngredient.icon(
                          recipe.mainIngredient,
                          width: AppTheme.paddingMedium,
                        )!,
                        Padding(
                          padding: EdgeInsets.only(left: AppTheme.paddingTiny),
                        ),
                        Difficulty.icon(
                          recipe.difficulty,
                          width: AppTheme.paddingHUGE,
                        )!,
                        Padding(
                          padding: EdgeInsets.only(left: AppTheme.paddingSmall),
                        ),
                        Text(
                          "${recipe.time} minuter",
                          style: AppTheme.smallText,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: AppTheme.paddingSmall),
                        ),
                        Text("${recipe.price} kr", style: AppTheme.smallText),
                      ],
                    ),
                    SizedBox(height: AppTheme.paddingSmall),
                    Text(recipe.description),
                    SizedBox(height: AppTheme.paddingSmall),
                    Text("Tillagning:", style: AppTheme.smallHeading),
                    SizedBox(height: AppTheme.paddingSmall),
                    Text(recipe.instruction),
                  ],
                ),
              ),
            ],
          ),
        ], // Children
      ),
    );
  }
}
