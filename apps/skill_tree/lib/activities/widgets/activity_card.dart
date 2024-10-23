import 'package:activities_repository/activities_repository.dart';
import 'package:flutter/material.dart';
import 'package:skill_tree/activities/widgets/linked_skill.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required this.activity,
    super.key,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Center(
              child: Text(
                activity.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Wrap(
              children: [
                ...activity.linkedSkills.map(
                  (linkedSkill) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: LinkedSkill(linkedSkill: linkedSkill),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Center(
              child: Text(
                '${activity.cooldown.inMinutes} min',
              ),
            ),
          ),
        ],
      ),
    );
  }
}