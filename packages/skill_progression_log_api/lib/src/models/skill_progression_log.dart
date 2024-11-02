import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:skill_progression_log_api/src/models/progression_source_type.dart';
import 'package:uuid/uuid.dart';

part 'skill_progression_log.g.dart';

/// Represents a snapshot of skill progression
@immutable
@JsonSerializable()
class SkillProgressionSnapshot extends Equatable {
  const SkillProgressionSnapshot({
    required this.skillId,
    required this.xpChange,
    required this.levelBefore,
    required this.levelAfter,
    required this.expBefore,
    required this.expAfter,
  });

  final String skillId;
  final int xpChange;
  final int levelBefore;
  final int levelAfter;
  final int expBefore;
  final int expAfter;

  @override
  List<Object> get props => [
        skillId,
        xpChange,
        levelBefore,
        levelAfter,
        expBefore,
        expAfter,
      ];

  factory SkillProgressionSnapshot.fromJson(Map<String, dynamic> json) =>
      _$SkillProgressionSnapshotFromJson(json);

  Map<String, dynamic> toJson() => _$SkillProgressionSnapshotToJson(this);
}

/// Represents a log entry for any type of skill progression
@immutable
@JsonSerializable()
class SkillProgressionLog extends Equatable {
  SkillProgressionLog({
    required this.sourceType,
    required this.sourceId,
    required this.sourceTitle,
    required this.timestamp,
    required this.skillProgressions,
    String? id,
  })  : assert(id == null || id.isNotEmpty, 'id should be null or empty'),
        id = id ?? const Uuid().v4();

  final String id;

  /// Type of source that triggered the progression
  @JsonKey(fromJson: _sourceTypeFromString, toJson: _sourceTypeToString)
  final ProgressionSourceType sourceType;

  /// ID of the source (activity ID, task ID, etc.)
  final String sourceId;

  /// Title/description of the source (stored in case source is deleted)
  final String sourceTitle;

  final DateTime timestamp;
  final List<SkillProgressionSnapshot> skillProgressions;

  @override
  List<Object> get props => [
        id,
        sourceType,
        sourceId,
        sourceTitle,
        timestamp,
        skillProgressions,
      ];

  factory SkillProgressionLog.fromJson(Map<String, dynamic> json) =>
      _$SkillProgressionLogFromJson(json);

  Map<String, dynamic> toJson() => _$SkillProgressionLogToJson(this);

  // Helper methods for enum serialization
  static ProgressionSourceType _sourceTypeFromString(String type) =>
      ProgressionSourceType.values.firstWhere(
        (t) => t.toString() == 'ProgressionSourceType.$type',
      );

  static String _sourceTypeToString(ProgressionSourceType type) =>
      type.toString().split('.').last;
}
