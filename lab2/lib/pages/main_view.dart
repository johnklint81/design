import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';

import '../widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), _recipeArea(context)]),
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
          const Text("Receptsök"),
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

  Widget _recipeArea(context) {
    return Expanded(
      child: Container(color: const Color.fromARGB(255, 204, 216, 176)),
    );
  }
}
