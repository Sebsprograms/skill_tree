import 'package:skills_api/models/skill.dart';

/// The interface for an API providing access to Skills
abstract class SkillsApi {
  /// Creates an instance of the [SkillsApi]
  const SkillsApi();

  /// Stream of skills
  Stream<List<Skill>> getSkills();

  /// Stream of 1 skill by id
  Stream<Skill?> getSkillById(String id);

  /// Delete a skill
  Future<void> deleteSkill(String id);

  /// Saves a skill
  Future<void> saveSkill(Skill skill);

  /// Increments xp of a skill and returns true if it trigged a level up
  Future<bool> incrementExp(String id, int xp);

  /// Decrement xp of a skill and returns true if a level was reverted
  Future<bool> decrementExp(String id, int xp);

  /// Get a colorCode from a skill by Id
  Future<String> getColorCode(String id);

  /// Closes the connection to the API.
  Future<void> close();
}

/// Exception thrown when a skill is not found
class SkillNotFoundException implements Exception {}
