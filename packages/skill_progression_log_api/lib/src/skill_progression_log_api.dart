// skill_progression_logs_api.dart
import 'package:skill_progression_log_api/src/models/progression_source_type.dart';
import 'package:skill_progression_log_api/src/models/skill_progression_log.dart';

abstract class SkillProgressionLogsApi {
  const SkillProgressionLogsApi();

  /// Stream of all progression logs
  Stream<List<SkillProgressionLog>> getLogs();

  /// Stream of logs for a specific skill
  Stream<List<SkillProgressionLog>> getLogsForSkill(String skillId);

  /// Stream of logs for a specific source type
  Stream<List<SkillProgressionLog>> getLogsBySourceType(
    ProgressionSourceType sourceType,
  );

  /// Stream of logs for a specific source
  Stream<List<SkillProgressionLog>> getLogsForSource(
    ProgressionSourceType sourceType,
    String sourceId,
  );

  /// Save a new progression log
  Future<void> saveLog(SkillProgressionLog log);

  /// Delete a log entry and revert its effects
  Future<void> deleteLogAndRevert(String logId);

  Future<void> close();
}
