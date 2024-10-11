import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/home/view/home_page.dart';
import 'package:skill_tree/l10n/l10n.dart';
import 'package:skill_tree/theme/theme.dart';
import 'package:skills_repository/skills_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.skillsRepository,
    super.key,
  });

  final SkillsRepository skillsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: skillsRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterSkillTreeTheme.light,
      darkTheme: FlutterSkillTreeTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
