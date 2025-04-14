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
              Padding(padding: EdgeInsets.only(left: AppTheme.paddingMedium)),
              _image(recipe),
              Padding(padding: EdgeInsets.only(left: AppTheme.paddingSmall)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(AppTheme.paddingTiny)),
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Padding(padding: EdgeInsets.all(AppTheme.paddingTiny)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MainIngredient.icon(
                          recipe.mainIngredient,
                          width: AppTheme.paddingMedium,
                        )!,
                        Padding(padding: EdgeInsets.all(AppTheme.paddingTiny)),
                        Difficulty.icon(
                          recipe.difficulty,
                          width: AppTheme.paddingHUGE,
                        )!,
                        Padding(padding: EdgeInsets.all(AppTheme.paddingTiny)),
                        Text(
                          "${recipe.time} minuter",
                          style: AppTheme.smallText,
                        ),
                        Padding(padding: EdgeInsets.all(AppTheme.paddingTiny)),
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
    var roundedImage = ClipRRect(
      borderRadius: BorderRadius.circular(12), // adjust for more/less rounding
      child: SizedBox(
        width: 104,
        height: 104,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: AppTheme.paddingLarge);

    return Stack(
      children: [
        roundedImage,
        Positioned(bottom: 8, right: 8, child: flagImage!),
      ],
    );
  }

}
