import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../constants/assets.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _time = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _time,
          divisions: 10,
          max: 150,
          onChanged: (double value) {
            setState(() {
              _time = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Assets.timeIcon, height: 16),
            Padding(
              padding: const EdgeInsets.only(right: AppTheme.paddingLarge, left: AppTheme.paddingSmall),
              child: Text('${_time.round()} minuter'),
            ),

          ],
        )
      ],
    );
  }
}