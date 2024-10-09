// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      id: json['id'] as String?,
      description: json['description'] as String? ?? '',
      linkedSkills: (json['linkedSkills'] as List<dynamic>?)
              ?.map((e) => TaskLinkedSkill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isComplete: json['isComplete'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'linkedSkills': instance.linkedSkills,
      'isComplete': instance.isComplete,
    };
