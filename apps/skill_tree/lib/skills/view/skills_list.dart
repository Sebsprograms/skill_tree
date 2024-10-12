import 'package:flutter/material.dart';
import 'package:skill_tree/create_skill/view/view.dart';
import 'package:skill_tree/l10n/l10n.dart';
import 'package:skill_tree/skills/widgets/skill_list_tile.dart';
import 'package:skills_api/models/models.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({required this.skills, super.key});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.skillsAppBarTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const Dialog(
              child: CreateSkillPage(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_circle,
          size: 40,
        ),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) => SkillListTile(
          skill: skills[index],
        ),
      ),
    );
  }
}
