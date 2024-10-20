import 'package:activities_repository/activities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/activities/bloc/activities_bloc.dart';
import 'package:skill_tree/create_activity/view/create_activity_page.dart';
import 'package:skill_tree/l10n/l10n.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivitiesBloc(
        activitiesRepository: context.read<ActivitiesRepository>(),
      )..add(ActivitiesSubsctiptionRequested()),
      child: const ActivitiesView(),
    );
  }
}

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.activitiesAppBarTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<CreateActivityPage>(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CreateActivityPage(),
              );
            },
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_circle,
          size: 40,
        ),
      ),
      body: BlocBuilder<ActivitiesBloc, ActivitiesState>(
        builder: (context, state) {
          switch (state.status) {
            case ActivitiesStatus.initial:
            case ActivitiesStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ActivitiesStatus.loaded:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: state.activities
                      .map(
                        (activity) => Column(
                          children: [
                            Text(activity.title),
                            Text(activity.cooldown.toString()),
                            ...activity.linkedSkills.map(
                              (linkedSkill) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(linkedSkill.skillId),
                                  Text(linkedSkill.xpReward.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              );
            case ActivitiesStatus.error:
              return const Center(
                child: Text('Error loading activities.'),
              );
          }
        },
      ),
    );
  }
}
