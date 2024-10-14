import 'package:flutter/widgets.dart';
import 'package:local_storage_activities_api/local_storage_activities_api.dart';
import 'package:local_storage_skills_api/local_storage_skills_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_tree/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  final skillsApi = LocalStorageSkillsApi(plugin: sharedPreferences);
  final activitiesApi = LocalStorageActivitiesApi(plugin: sharedPreferences);

  bootstrap(
    skillsApi: skillsApi,
    activitiesApi: activitiesApi,
  );
}
