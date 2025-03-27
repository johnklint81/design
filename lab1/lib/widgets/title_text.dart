import 'package:flutter/cupertino.dart';

import '../model/task.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.task, {super.key});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Text(
      task.title,
      style: TextStyle(
          decoration: task.completed ? TextDecoration.lineThrough : null),
    );
  }
}