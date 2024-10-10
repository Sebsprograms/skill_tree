import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_api/models/skill.dart';
import 'package:skills_api/skills_api.dart';

/// Api for [Skill] CRUD and storing locally
class LocalStorageSkillsApi extends SkillsApi {
  /// Initializes the [LocalStorageSkillsApi] with [SharedPreferences] instance
  LocalStorageSkillsApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    init();
  }

  /// The instance of SharedPreferences used for local storage
  final SharedPreferences _plugin;

  /// A stream controller to broadcast the list of skills, initialized with an empty list
  late final _skillStreamController = BehaviorSubject<List<Skill>>.seeded([]);

  /// Key used for storing skills in SharedPreferences
  static const kSkillsCollectionKey = '_skills_key_';

  /// Retrieves a value from SharedPreferences by the given key
  String? _getValue(String key) => _plugin.getString(key);

  /// Sets a value in SharedPreferences for the given key
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  /// Initializes the skill list by reading from SharedPreferences
  void init() {
    final skillsJson = _getValue(kSkillsCollectionKey);

    if (skillsJson != null) {
      final skills = List<Map<String, dynamic>>.from(
        json.decode(skillsJson) as List,
      )
          .map(
            (e) => Skill.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();
      _skillStreamController.add(skills);
    } else {
      _skillStreamController.add(const []);
    }
  }

  @override
  Stream<List<Skill>> getSkills() => _skillStreamController.asBroadcastStream();

  @override
  Future<void> saveSkill(Skill skill) {
    final skills = [..._skillStreamController.value];
    final skillIndex = skills.indexWhere((s) => s.id == skill.id);

    if (skillIndex >= 0) {
      skills[skillIndex] = skill;
    } else {
      skills.add(skill);
    }

    _skillStreamController.add(skills);

    return _setValue(
      kSkillsCollectionKey,
      json.encode(skills),
    );
  }

  @override
  Future<void> deleteSkill(String id) {
    final skills = [..._skillStreamController.value];
    final skillIndex = skills.indexWhere((s) => s.id == id);

    if (skillIndex == -1) {
      throw SkillNotFoundException();
    } else {
      skills.removeAt(skillIndex);
      _skillStreamController.add(skills);
      return _setValue(
        kSkillsCollectionKey,
        json.encode(skills),
      );
    }
  }

  @override
  Future<bool> incrementExp(String id, int xp) async {
    final skills = [..._skillStreamController.value];
    final skillIndex = skills.indexWhere((s) => s.id == id);

    if (skillIndex == -1) {
      throw SkillNotFoundException();
    } else {
      final selectedSkill = skills[skillIndex];
      final currentExp = selectedSkill.currentExp;
      final expToNextLevel = selectedSkill.requiredExpToNextLevel;
      final currentLevel = selectedSkill.currentLevel;
      final progressDifficulty = selectedSkill.progressDifficulty;

      if (currentExp + xp >= expToNextLevel) {
        // A level up will happen
        final remainingExp = (currentExp + xp) - expToNextLevel;
        final newExpToNextLevel =
            expToNextLevel + progressDifficulty.expIncrease;
        final newLevel = currentLevel + 1;

        skills[skillIndex] = selectedSkill.copyWith(
          currentExp: remainingExp,
          requiredExpToNextLevel: newExpToNextLevel,
          currentLevel: newLevel,
        );
        _skillStreamController.add(skills);
        await _setValue(kSkillsCollectionKey, json.encode(skills));
        return true;
      } else {
        // No level up
        skills[skillIndex] = selectedSkill.copyWith(
          currentExp: currentExp + xp,
        );
        _skillStreamController.add(skills);
        await _setValue(kSkillsCollectionKey, json.encode(skills));
        return false;
      }
    }
  }

  @override
  Future<bool> decrementExp(String id, int xp) async {
    final skills = [..._skillStreamController.value];
    final skillIndex = skills.indexWhere((s) => s.id == id);

    if (skillIndex == -1) {
      throw SkillNotFoundException();
    } else {
      final selectedSkill = skills[skillIndex];
      final currentExp = selectedSkill.currentExp;
      final expToNextLevel = selectedSkill.requiredExpToNextLevel;
      final currentLevel = selectedSkill.currentLevel;
      final progressDifficulty = selectedSkill.progressDifficulty;

      if (currentExp - xp < 0) {
        // Level needs to be decremented
        final carryOverExp = currentExp - xp;
        final preExpToNextLevel =
            expToNextLevel - progressDifficulty.expIncrease;
        final newLevel = currentLevel - 1;

        skills[skillIndex] = selectedSkill.copyWith(
          // Adding because carryoverexp will be negative
          currentExp: preExpToNextLevel + carryOverExp,
          requiredExpToNextLevel: preExpToNextLevel,
          currentLevel: newLevel,
        );
        _skillStreamController.add(skills);
        await _setValue(kSkillsCollectionKey, json.encode(skills));
        return true;
      } else {
        // No level up
        skills[skillIndex] = selectedSkill.copyWith(
          currentExp: currentExp - xp,
        );
        _skillStreamController.add(skills);
        await _setValue(kSkillsCollectionKey, json.encode(skills));
        return false;
      }
    }
  }

  @override
  Future<String> getColorCode(String id) async {
    final skills = [..._skillStreamController.value];
    final skillIndex = skills.indexWhere((s) => s.id == id);
    final selectedSkill = skills[skillIndex];
    return selectedSkill.colorCode;
  }

  @override
  Future<void> close() async {
    await _skillStreamController.close();
  }
}
