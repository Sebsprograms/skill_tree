import 'package:skills_api/models/skill.dart';
import 'package:skills_api/skills_api.dart';

/// A repository for interacting with the SkillsApi
class SkillsRepository {
  /// Creates an instance of [SkillsRepository]
  const SkillsRepository({
    required SkillsApi skillsApi,
  }) : _skillsApi = skillsApi;

  final SkillsApi _skillsApi;

  /// Stream of Skills
  Stream<List<Skill>> getSkills() => _skillsApi.getSkills();

  /// Stream of 1 Skill by id
  Stream<Skill?> getSkillById(String id) => _skillsApi.getSkillById(id);

  /// Deletes a skill using an id
  Future<void> deleteSkill(String id) => _skillsApi.deleteSkill(id);

  /// Saves a skill either new or overwrite exisiting
  Future<void> saveSkill(Skill skill) => _skillsApi.saveSkill(skill);

  /// Increments xp of a skill and returns true if it trigged a level up
  Future<bool> incrementExp(String id, int xp) =>
      _skillsApi.incrementExp(id, xp);

  /// Decrement xp of a skill and returns true if a level was reverted
  Future<bool> decrementExp(String id, int xp) =>
      _skillsApi.decrementExp(id, xp);

  /// Get a colorCode from a skill by Id
  Future<String> getColorCode(String id) => _skillsApi.getColorCode(id);
}
