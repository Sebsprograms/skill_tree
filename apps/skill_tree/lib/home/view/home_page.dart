import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/home/cubit/home_cubit.dart';
import 'package:skill_tree/home/widgets/tab_button.dart';
import 'package:skill_tree/l10n/l10n.dart';

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
          Center(
            child: Text(context.l10n.activitiesAppBarTitle),
          ),
          Center(
            child: Text(context.l10n.settingsAppBarTitle),
          ),
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
              icon: const Icon(Icons.abc),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.activities,
              icon: const Icon(Icons.abc),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.skills,
              icon: const Icon(Icons.abc),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.stats,
              icon: const Icon(Icons.abc),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.logs,
              icon: const Icon(Icons.abc),
            ),
            TabButton(
              groupValue: currentTab,
              value: HomeTab.settings,
              icon: const Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}
