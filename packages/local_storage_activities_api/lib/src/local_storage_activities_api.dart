import 'dart:convert';

import 'package:activities_api/activities_api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An api for storing [Activity] data locally as JSON
class LocalStorageActivitiesApi extends ActivitiesApi {
  /// Initializes [LocalStorageActivitiesApi] with [SharedPreferences]
  LocalStorageActivitiesApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    init();
  }

  /// The instance of SharedPreferences used for local storage
  final SharedPreferences _plugin;

  /// A stream controller to broadcast the list of activities
  late final _activitiesStreamController =
      BehaviorSubject<List<Activity>>.seeded([]);

  /// Key used for storing skills in SharedPreferences
  static const kActivitiesCollectionKey = '_activities_key_';

  /// Retrieves a value from SharedPreferences by the given key
  String? _getValue(String key) => _plugin.getString(key);

  /// Sets a value in SharedPreferences for the given key
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  /// Initializes stream of [Activity] from local storage
  void init() {
    final activitiesJson = _getValue(kActivitiesCollectionKey);

    if (activitiesJson != null) {
      final activities =
          List<Map<String, dynamic>>.from(json.decode(activitiesJson) as List)
              .map((e) => Activity.fromJson(Map<String, dynamic>.from(e)))
              .toList();
      _activitiesStreamController.add(activities);
    } else {
      _activitiesStreamController.add(const []);
    }
  }

  @override
  Stream<List<Activity>> getActivities() =>
      _activitiesStreamController.asBroadcastStream();

  @override
  Stream<List<Activity>> getActivitiesRelatedToSkill(String skillId) {
    return _activitiesStreamController.stream.map(
      (activities) {
        List<Activity> matchedActivities = [];
        for (final activity in activities) {
          for (final linkedSkill in activity.linkedSkills) {
            if (linkedSkill.skillId == skillId) {
              matchedActivities.add(activity);
              break;
            }
          }
        }
        return matchedActivities;
      },
    );
  }

  @override
  Future<void> saveActivity(Activity activity) {
    final activities = [..._activitiesStreamController.value];
    final activitiesIndex = activities.indexWhere((a) => a.id == activity.id);

    if (activitiesIndex >= 0) {
      activities[activitiesIndex] = activity;
    } else {
      activities.add(activity);
    }

    _activitiesStreamController.add(activities);

    return _setValue(
      kActivitiesCollectionKey,
      json.encode(activities),
    );
  }

  @override
  Future<void> deleteActivity(String id) {
    final activities = [..._activitiesStreamController.value];
    final activitiesIndex = activities.indexWhere((a) => a.id == id);

    if (activitiesIndex == -1) {
      throw ActivityNotFoundException();
    } else {
      activities.removeAt(activitiesIndex);
      _activitiesStreamController.add(activities);
    }

    return _setValue(kActivitiesCollectionKey, json.encode(activities));
  }

  @override
  Future<void> close() async {
    await _activitiesStreamController.close();
  }
}
