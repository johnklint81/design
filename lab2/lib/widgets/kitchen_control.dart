import 'package:flutter/material.dart';
import '../util/cuisine.dart';

class KitchenControl extends StatelessWidget {
  const KitchenControl({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = Cuisine.labels;

    return Row(
      mainAxisSize: MainAxisSize.min, // don't expand
      children: [
        const Text("Kök"),
        const SizedBox(width: 12),
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
              DropdownMenuEntry(value: labels[i], label: labels[i]),
          ],
          onSelected: (value) {},
        ),
      ],
    );
  }
}
