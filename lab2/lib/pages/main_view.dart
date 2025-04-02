import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [_controlPanel(context), _recipeArea(context)]),
    );
  }
  Widget _controlPanel(context, {double width = 320}) {
    return Placeholder();
  }
  Widget _recipeArea(context) {
    return Expanded(child: Placeholder());
  }
}
