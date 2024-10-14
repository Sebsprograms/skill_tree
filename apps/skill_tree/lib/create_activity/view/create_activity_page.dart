import 'package:activities_api/activities_api.dart';
import 'package:activities_repository/activities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/create_activity/bloc/create_activity_bloc.dart';
import 'package:skill_tree/create_activity/widgets/create_activity_cooldown.dart';
import 'package:skill_tree/create_activity/widgets/create_activity_linked_skills.dart';
import 'package:skill_tree/create_activity/widgets/create_activity_title.dart';
import 'package:skills_repository/skills_repository.dart';

class CreateActivityPage extends StatelessWidget {
  const CreateActivityPage({
    this.initialActivity,
    super.key,
  });

  final Activity? initialActivity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateActivityBloc(
        skillsRepository: context.read<SkillsRepository>(),
        activitiesRepository: context.read<ActivitiesRepository>(),
        initialActivity: initialActivity,
      )..add(SkillsSubscriptionRequested()),
      child: CreateActivityView(
        initialActivity: initialActivity,
      ),
    );
  }
}

class CreateActivityView extends StatelessWidget {
  const CreateActivityView({this.initialActivity, super.key});
  final Activity? initialActivity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateActivityBloc, CreateActivityState>(
      builder: (context, state) {
        switch (state.status) {
          case CreateActivityStatus.initial:
          case CreateActivityStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CreateActivityStatus.loaded:
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: Text(
                      initialActivity == null
                          ? 'Create Activity'
                          : 'Edit Activity',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CreateActivityTitle(),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Cooldown'),
                          SizedBox(
                            height: 4,
                          ),
                          CreateActivityCooldown(),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Linked Skill(s)'),
                          SizedBox(
                            height: 4,
                          ),
                          CreateActivityLinkedSkills(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        BlocBuilder<CreateActivityBloc, CreateActivityState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.isValid
                                  ? () async {
                                      context
                                          .read<CreateActivityBloc>()
                                          .add(ActivityFormSubmittedEvent());

                                      Navigator.pop(context);
                                    }
                                  : null,
                              child: const Text('Submit'),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          case CreateActivityStatus.error:
            return const Center(
              child: Text('Something went wrong'),
            );
        }
      },
    );
  }
}
