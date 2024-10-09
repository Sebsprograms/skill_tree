// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_linked_skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskLinkedSkill _$TaskLinkedSkillFromJson(Map<String, dynamic> json) =>
    TaskLinkedSkill(
      skillId: json['skillId'] as String,
      xpReward: (json['xpReward'] as num).toInt(),
    );

Map<String, dynamic> _$TaskLinkedSkillToJson(TaskLinkedSkill instance) =>
    <String, dynamic>{
      'skillId': instance.skillId,
      'xpReward': instance.xpReward,
    };
