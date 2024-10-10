import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/home/cubit/home_cubit.dart';

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
            child: Text('${currentTab.index} $currentTab'),
          ),
          Center(
            child: Text('${currentTab.index} $currentTab'),
          ),
          Center(
            child: Text('${currentTab.index} $currentTab'),
          ),
          Center(
            child: Text('${currentTab.index} $currentTab'),
          ),
          Center(
            child: Text('${currentTab.index} $currentTab'),
          ),
          Center(
            child: Text('${currentTab.index} $currentTab'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.activities,
              icon: const Icon(Icons.abc),
            ),
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.logs,
              icon: const Icon(Icons.abc),
            ),
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.settings,
              icon: const Icon(Icons.abc),
            ),
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.skills,
              icon: const Icon(Icons.abc),
            ),
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.stats,
              icon: const Icon(Icons.abc),
            ),
            _HomeTabButton(
              groupValue: currentTab,
              value: HomeTab.tasks,
              icon: const Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      color:
          groupValue == value ? Theme.of(context).colorScheme.secondary : null,
      iconSize: 32,
      icon: icon,
    );
  }
}
