import 'package:skill_tree/models/task.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

/// A Skill represents a goal where progress should be tracked
class Skill {
  Skill({
    required this.title,
    required this.tasks,
  });

  final String id = uuid.v4();

  /// What this skill is called
  final String title;

  /// The current level, starts with 1.
  int level = 1;

  /// The current amount of exp
  int _currentExp = 0;

  /// The amount of currentExp required to level up
  int _expToNextLvl = 100;

  List<Task> tasks;

  int get currentExp {
    return _currentExp;
  }

  int get expToNextLvl {
    return _expToNextLvl;
  }

  void increaseExp(int exp) {
    if ((exp + _currentExp) >= _expToNextLvl) {
      int remainder = (_currentExp + exp) - _expToNextLvl;
      increaseNextLvlExp();
      _currentExp = 0;
      level++;
      increaseExp(remainder);
    } else {
      _currentExp += exp;
    }
  }

  void increaseNextLvlExp() {
    _expToNextLvl = (_expToNextLvl * 1.1).floor();
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void increaseExpUsingTasks(String id) {
    for (Task task in tasks) {
      if (task.id == id) {
        increaseExp(task.exp);
      }
    }
  }
}
