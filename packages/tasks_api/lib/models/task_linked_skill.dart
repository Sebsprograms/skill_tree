import 'package:json_annotation/json_annotation.dart';

part 'task_linked_skill.g.dart';

/// Represents a relationship to a skill via the skill's id
/// the xpReward is used to increment a skill's current xp
@JsonSerializable()
class TaskLinkedSkill {
  /// Creates a new [TaskLinkedSkill] object.
  ///
  /// A skill id and xp rewards are required
  const TaskLinkedSkill({
    required this.skillId,
    required this.xpReward,
  });

  /// The Id of the related skill
  final String skillId;

  /// The xp reward for the related skill
  final int xpReward;

  /// Converts a JSON map into a [TaskLinkedSkill] instance.
  factory TaskLinkedSkill.fromJson(Map<String, dynamic> json) =>
      _$TaskLinkedSkillFromJson(json);

  /// Converts the [TaskLinkedSkill] instance into a JSON map.
  Map<String, dynamic> toJson() => _$TaskLinkedSkillToJson(this);
}
