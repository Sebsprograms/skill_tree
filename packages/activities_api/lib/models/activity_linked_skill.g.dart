// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_linked_skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLinkedSkill _$ActivityLinkedSkillFromJson(Map<String, dynamic> json) =>
    ActivityLinkedSkill(
      skillId: json['skillId'] as String,
      xpReward: (json['xpReward'] as num).toInt(),
    );

Map<String, dynamic> _$ActivityLinkedSkillToJson(
        ActivityLinkedSkill instance) =>
    <String, dynamic>{
      'skillId': instance.skillId,
      'xpReward': instance.xpReward,
    };
