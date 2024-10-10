// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      title: json['title'] as String,
      id: json['id'] as String?,
      linkedSkills: (json['linkedSkills'] as List<dynamic>?)
              ?.map((e) =>
                  ActivityLinkedSkill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cooldown: json['cooldown'] == null
          ? const Duration(minutes: 30)
          : Duration(microseconds: (json['cooldown'] as num).toInt()),
      lastUsed: json['lastUsed'] == null
          ? null
          : DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'linkedSkills': instance.linkedSkills,
      'cooldown': instance.cooldown.inMicroseconds,
      'lastUsed': instance.lastUsed?.toIso8601String(),
    };
