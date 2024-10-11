import 'package:flutter/material.dart';

class ExpBar extends StatelessWidget {
  const ExpBar({
    required this.currentExp,
    required this.expRequiredToLevelUp,
    super.key,
  });

  final int currentExp;
  final int expRequiredToLevelUp;

  @override
  Widget build(BuildContext context) {
    final progress = currentExp / expRequiredToLevelUp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LinearProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
          backgroundColor: Colors.grey[400],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
        ),
        const SizedBox(height: 4),
        Text(
          '$currentExp / $expRequiredToLevelUp XP',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
