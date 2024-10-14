import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/activities/view/activities_page.dart';
import 'package:skill_tree/home/cubit/home_cubit.dart';
import 'package:skill_tree/home/widgets/tab_button.dart';
import 'package:skill_tree/l10n/l10n.dart';
import 'package:skill_tree/skills/view/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: IndexedStack(
        index: currentTab.index,
        children: [
          Center(
            child: Text(context.l10n.tasksAppBarTitle),
          ),
          const ActivitiesPage(),
          const SkillsPage(),
          Center(
            child: Text(context.l10n.statisticsAppBarTitle),
          ),
          Center(
            child: Text(context.l10n.logsAppBarTitle),
          ),
          Center(
            child: Text(context.l10n.settingsAppBarTitle),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabButton(
              groupValue: currentTab,
              value: HomeTab.tasks,
              icon: const Icon(Icons.checklist_rounded),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.activities,
              icon: const Icon(Icons.stream_rounded),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.skills,
              icon: const Icon(Icons.star_rounded),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.stats,
              icon: const Icon(Icons.bar_chart_rounded),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.logs,
              icon: const Icon(Icons.history_rounded),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.settings,
              icon: const Icon(Icons.settings_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
