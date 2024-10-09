// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      title: json['title'] as String,
      colorCode: json['colorCode'] as String,
      id: json['id'] as String?,
      description: json['description'] as String? ?? '',
      progressDifficulty: json['progressDifficulty'] == null
          ? ProgressDifficulty.medium
          : Skill._difficultyFromString(json['progressDifficulty'] as String),
      currentExp: (json['currentExp'] as num?)?.toInt() ?? 0,
      currentLevel: (json['currentLevel'] as num?)?.toInt() ?? 1,
      requiredExpToNextLevel:
          (json['requiredExpToNextLevel'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'progressDifficulty':
          Skill._difficultyToString(instance.progressDifficulty),
      'colorCode': instance.colorCode,
      'currentLevel': instance.currentLevel,
      'currentExp': instance.currentExp,
      'requiredExpToNextLevel': instance.requiredExpToNextLevel,
    };
