import 'package:activities_repository/activities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/home/view/home_page.dart';
import 'package:skill_tree/l10n/l10n.dart';
import 'package:skill_tree/theme/theme.dart';
import 'package:skills_repository/skills_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.skillsRepository,
    required this.activitiesRepository,
    super.key,
  });

  final SkillsRepository skillsRepository;
  final ActivitiesRepository activitiesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: skillsRepository,
        ),
        RepositoryProvider.value(
          value: activitiesRepository,
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlutterSkillTreeTheme.light,
      darkTheme: FlutterSkillTreeTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
