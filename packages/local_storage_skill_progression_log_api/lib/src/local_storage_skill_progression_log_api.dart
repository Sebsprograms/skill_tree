import 'dart:convert';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_progression_log_api/skill_progression_log_api.dart';
import 'package:skill_progression_log_api/src/models/models.dart';
import 'package:skills_repository/skills_repository.dart';

class LocalStorageSkillProgressionLogsApi extends SkillProgressionLogsApi {
  LocalStorageSkillProgressionLogsApi({
    required SharedPreferences plugin,
    required SkillsRepository skillsRepository,
  })  : _plugin = plugin,
        _skillsRepository = skillsRepository {
    init();
  }

  final SharedPreferences _plugin;
  final SkillsRepository _skillsRepository;

  late final _logsStreamController =
      BehaviorSubject<List<SkillProgressionLog>>.seeded([]);

  static const kLogsCollectionKey = '_skill_progression_logs_key_';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void init() {
    final logsJson = _getValue(kLogsCollectionKey);
    if (logsJson != null) {
      final logs = List<Map<String, dynamic>>.from(
        json.decode(logsJson) as List,
      )
          .map(
              (e) => SkillProgressionLog.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      _logsStreamController.add(logs);
    } else {
      _logsStreamController.add(const []);
    }
  }

  @override
  Stream<List<SkillProgressionLog>> getLogs() =>
      _logsStreamController.asBroadcastStream();

  @override
  Stream<List<SkillProgressionLog>> getLogsForSkill(String skillId) {
    return _logsStreamController.stream.map((logs) => logs
        .where((log) => log.skillProgressions
            .any((progression) => progression.skillId == skillId))
        .toList());
  }

  @override
  Future<void> saveLog(SkillProgressionLog log) async {
    final logs = [..._logsStreamController.value];
    logs.add(log);
    _logsStreamController.add(logs);
    await _setValue(kLogsCollectionKey, json.encode(logs));
  }

  @override
  Stream<List<SkillProgressionLog>> getLogsBySourceType(
    ProgressionSourceType sourceType,
  ) {
    return _logsStreamController.stream.map(
        (logs) => logs.where((log) => log.sourceType == sourceType).toList());
  }

  @override
  Stream<List<SkillProgressionLog>> getLogsForSource(
    ProgressionSourceType sourceType,
    String sourceId,
  ) {
    return _logsStreamController.stream.map((logs) => logs
        .where(
            (log) => log.sourceType == sourceType && log.sourceId == sourceId)
        .toList());
  }

  @override
  Future<void> deleteLogAndRevert(String logId) async {
    final logs = [..._logsStreamController.value];
    final logIndex = logs.indexWhere((log) => log.id == logId);

    if (logIndex == -1) {
      throw LogNotFoundException();
    }

    // Revert the changes for each skill progression
    final log = logs[logIndex];
    for (final progression in log.skillProgressions) {
      final xpToRevert = progression.xpChange;
      if (xpToRevert > 0) {
        await _skillsRepository.decrementExp(progression.skillId, xpToRevert);
      } else {
        await _skillsRepository.incrementExp(
            progression.skillId, xpToRevert.abs());
      }
    }

    // Remove the log entry
    logs.removeAt(logIndex);
    _logsStreamController.add(logs);
    await _setValue(kLogsCollectionKey, json.encode(logs));
  }

  @override
  Future<void> close() async {
    await _logsStreamController.close();
  }
}

// Helper function for creating logs
SkillProgressionLog createProgressionLog({
  required ProgressionSourceType sourceType,
  required String sourceId,
  required String sourceTitle,
  required List<SkillProgressionSnapshot> progressions,
}) {
  return SkillProgressionLog(
    sourceType: sourceType,
    sourceId: sourceId,
    sourceTitle: sourceTitle,
    timestamp: DateTime.now(),
    skillProgressions: progressions,
  );
}

class LogNotFoundException implements Exception {
  final String message;

  LogNotFoundException([this.message = "Log not found"]);

  @override
  String toString() => "LogNotFoundException: $message";
}
