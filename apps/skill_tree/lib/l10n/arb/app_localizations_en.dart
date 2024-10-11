import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Skill Tree';

  @override
  String get activitiesAppBarTitle => 'Activities';

  @override
  String get skillsAppBarTitle => 'Skills';

  @override
  String get tasksAppBarTitle => 'Tasks';

  @override
  String get statisticsAppBarTitle => 'Statistics';

  @override
  String get settingsAppBarTitle => 'Settings';

  @override
  String get logsAppBarTitle => 'Logs';
}
