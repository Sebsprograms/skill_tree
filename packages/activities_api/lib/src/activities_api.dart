import 'package:activities_api/src/models/activity.dart';

/// The interface for an API providing access to Activities
abstract class ActivitiesApi {
  /// Creates an instance of the [ActivitiesApi]
  const ActivitiesApi();

  /// Stream of Activities
  Stream<List<Activity>> getActivities();

  /// Stream of Activities related to a skill
  Stream<List<Activity>> getActivitiesRelatedToSkill(String skillId);

  /// Delete an Activity
  Future<void> deleteActivity(String id);

  /// Save an Activity
  Future<void> saveActivity(Activity task);

  /// Close the connection to the API
  Future<void> close();
}
