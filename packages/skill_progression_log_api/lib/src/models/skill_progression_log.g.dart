// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_progression_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillProgressionSnapshot _$SkillProgressionSnapshotFromJson(
        Map<String, dynamic> json) =>
    SkillProgressionSnapshot(
      skillId: json['skillId'] as String,
      xpChange: (json['xpChange'] as num).toInt(),
      levelBefore: (json['levelBefore'] as num).toInt(),
      levelAfter: (json['levelAfter'] as num).toInt(),
      expBefore: (json['expBefore'] as num).toInt(),
      expAfter: (json['expAfter'] as num).toInt(),
    );

Map<String, dynamic> _$SkillProgressionSnapshotToJson(
        SkillProgressionSnapshot instance) =>
    <String, dynamic>{
      'skillId': instance.skillId,
      'xpChange': instance.xpChange,
      'levelBefore': instance.levelBefore,
      'levelAfter': instance.levelAfter,
      'expBefore': instance.expBefore,
      'expAfter': instance.expAfter,
    };

SkillProgressionLog _$SkillProgressionLogFromJson(Map<String, dynamic> json) =>
    SkillProgressionLog(
      sourceType: SkillProgressionLog._sourceTypeFromString(
          json['sourceType'] as String),
      sourceId: json['sourceId'] as String,
      sourceTitle: json['sourceTitle'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      skillProgressions: (json['skillProgressions'] as List<dynamic>)
          .map((e) =>
              SkillProgressionSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SkillProgressionLogToJson(
        SkillProgressionLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceType':
          SkillProgressionLog._sourceTypeToString(instance.sourceType),
      'sourceId': instance.sourceId,
      'sourceTitle': instance.sourceTitle,
      'timestamp': instance.timestamp.toIso8601String(),
      'skillProgressions': instance.skillProgressions,
    };
