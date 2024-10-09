import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:skills_api/models/models.dart';
import 'package:uuid/uuid.dart';

part 'skill.g.dart';

/// Represents a skill with details such as title, description, color, and
/// progress tracking elements like experience and difficulty level.
@immutable
@JsonSerializable()
class Skill extends Equatable {
  /// Creates a new [Skill] object.
  ///
  /// The [title] and [colorCode] are required fields.
  /// If no [id] is provided, a new unique ID will be generated.
  /// [progressDifficulty] defaults to [ProgressDifficulty.medium].
  /// [currentExp], [currentLevel], and [requiredExpToNextLevel] default
  /// to values representing a new skill.
  Skill({
    required this.title,
    required this.colorCode,
    String? id,
    this.description = '',
    this.progressDifficulty = ProgressDifficulty.medium,
    this.currentExp = 0,
    this.currentLevel = 1,
    this.requiredExpToNextLevel = 100,
  })  : assert(id == null || id.isNotEmpty, 'id should be null or empty'),
        id = id ?? const Uuid().v4();

  /// Unique identifier for the skill.
  final String id;

  /// The title of the skill.
  final String title;

  /// A brief description of the skill.
  ///
  /// Defaults to an empty string if not provided.
  final String description;

  /// The progress difficulty level of the skill.
  ///
  /// Uses the [ProgressDifficulty] enum.
  /// Defaults to [ProgressDifficulty.medium] if not specified.
  @JsonKey(fromJson: _difficultyFromString, toJson: _difficultyToString)
  final ProgressDifficulty progressDifficulty;

  /// Hex color code associated with the skill.
  ///
  /// This color can represent the skill in UI elements.
  final String colorCode;

  /// The current level of the skill.
  ///
  /// Defaults to 1 for new skills.
  final int currentLevel;

  /// The current experience points accumulated for the skill.
  ///
  /// Defaults to 0 for new skills.
  final int currentExp;

  /// The required experience points to reach the next level.
  ///
  /// Defaults to 100 for new skills.
  final int requiredExpToNextLevel;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        progressDifficulty,
        colorCode,
        currentLevel,
        currentExp,
        requiredExpToNextLevel,
      ];

  /// Converts a JSON map into a [Skill] instance.
  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  /// Converts the [Skill] instance into a JSON map.
  Map<String, dynamic> toJson() => _$SkillToJson(this);

  // Helper methods for serializing the enum
  static ProgressDifficulty _difficultyFromString(String difficulty) =>
      ProgressDifficulty.fromString(difficulty);

  static String _difficultyToString(ProgressDifficulty difficulty) =>
      difficulty.toString();
}
