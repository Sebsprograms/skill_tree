import 'package:activities_repository/activities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/activities/bloc/activities_bloc.dart';
import 'package:skill_tree/activities/widgets/linked_skill.dart';
import 'package:skill_tree/create_activity/view/create_activity_page.dart';
import 'package:skill_tree/home/view/home_page.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required this.activity,
    super.key,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state.mode == Mode.edit) {
              showDialog<CreateActivityPage>(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CreateActivityPage(
                      initialActivity: activity,
                    ),
                  );
                },
              );
            } else {
              print('SCORE & COOLDOWN');
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(bottom: 16),
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: Text(
                      activity.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Wrap(
                    children: [
                      ...activity.linkedSkills.map(
                        (linkedSkill) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: LinkedSkill(linkedSkill: linkedSkill),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: Text(
                      '${activity.cooldown.inMinutes} min',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
