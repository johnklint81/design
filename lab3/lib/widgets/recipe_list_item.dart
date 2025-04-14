import 'package:flutter/material.dart';
import 'package:lab3/widgets/difficulty_control.dart';
import '../app_theme.dart';
import '../model/recipe_database/ingredient.dart';
import '../model/recipe_database/recipe.dart';
import '../util/cuisine.dart';
import '../util/difficulty.dart';
import '../util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
          height: 128,
          child: Row(
            children: [
              _image(recipe),
              Padding(padding: EdgeInsets.only(left: AppTheme.paddingSmall)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppTheme.paddingTiny),
                    ),
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
                  ], // Children
                ),
              ),
            ], // Children
          ),
        ),
      ),
    );
  }

  @override
  Widget _image(recipe) {
    var square = ClipRect(
      child: SizedBox(
        width: 104, // Square width
        height: 104, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: AppTheme.paddingLarge);
    return Stack(
      children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
    );
  }
}
