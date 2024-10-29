import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_linked_skill.g.dart';

/// Represents a relationship to a skill via the skill's id
/// the xpReward is used to increment a skill's current xp
@JsonSerializable()
class ActivityLinkedSkill extends Equatable {
  /// Creates a new [ActivityLinkedSkill] object.
  ///
  /// A skill id and xp rewards are required
  const ActivityLinkedSkill({
    required this.skillId,
    required this.xpReward,
  });

  /// The Id of the related skill
  final String skillId;

  /// The xp reward for the related skill
  final int xpReward;

  /// Converts a JSON map into a [ActivityLinkedSkill] instance.
  factory ActivityLinkedSkill.fromJson(Map<String, dynamic> json) =>
      _$ActivityLinkedSkillFromJson(json);

  /// Converts the [ActivityLinkedSkill] instance into a JSON map.
  Map<String, dynamic> toJson() => _$ActivityLinkedSkillToJson(this);

  @override
  List<Object> get props => [
        skillId,
        xpReward,
      ];
}
