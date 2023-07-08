import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';

class SkillDetailTitle extends StatelessWidget {
  const SkillDetailTitle({
    super.key,
    required this.skill,
    required this.deleteSkill,
    required this.addSkill,
  });
  final Skill skill;
  final void Function(String skillId) deleteSkill;
  final void Function(Skill skill) addSkill;

  void delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text("Are you sure you want to delete ${skill.title}?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Deleted: ${skill.title}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                action: SnackBarAction(
                  textColor: Theme.of(context).colorScheme.secondaryContainer,
                  label: 'Undo',
                  onPressed: () {
                    addSkill(skill);
                  },
                ),
              ));
              deleteSkill(skill.id);
              Navigator.of(context).pop();
              Navigator.pop(ctx);
            },
            child: const Text("Delete"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            delete(context);
          },
          icon: const Icon(Icons.delete),
        ),
        Text(skill.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
