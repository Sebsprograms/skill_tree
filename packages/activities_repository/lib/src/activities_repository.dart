import 'package:activities_api/activities_api.dart';

/// A repository for interacting with the activities API
class ActivitiesRepository {
  /// Creates an instance of [ActivitiesRepository]
  const ActivitiesRepository({
    required ActivitiesApi activitiesApi,
  }) : _activitiesApi = activitiesApi;

  final ActivitiesApi _activitiesApi;

  /// Stream of Activities
  Stream<List<Activity>> getActivities() => _activitiesApi.getActivities();

  /// Stream of Activities related to a skill
  Stream<List<Activity>> getActivitiesRelatedToSkill(String skillId) =>
      _activitiesApi.getActivitiesRelatedToSkill(skillId);

  /// Save an Activity
  Future<void> saveActivity(Activity task) => _activitiesApi.saveActivity(task);

  /// Delete an Activity
  Future<void> deleteActivity(String id) => _activitiesApi.deleteActivity(id);
}
