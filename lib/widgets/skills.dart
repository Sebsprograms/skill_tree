import 'package:flutter/material.dart';
import 'package:skill_tree/models/skill.dart';
import 'package:skill_tree/models/task.dart';
import 'package:skill_tree/widgets/new_skill/new_skill_form.dart';
import 'package:skill_tree/widgets/skill_card/skill_card.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() {
    return _SkillsState();
  }
}

class _SkillsState extends State<Skills> {
  List<Skill> skills = [
    Skill(title: "Programming", tasks: [
      Task(name: "Practice", exp: 10),
      Task(name: "Complete Project", exp: 50),
      Task(name: "Complete Milestone", exp: 100),
    ]),
    Skill(title: "Work out", tasks: [
      Task(name: "Train 1hr", exp: 10),
      Task(name: "1 week consistent", exp: 70),
    ]),
    Skill(title: "Business", tasks: [
      Task(name: "Make income", exp: 10),
      Task(name: "New Product", exp: 170),
      Task(name: "New Client", exp: 30),
    ]),
  ];

  void increaseExp(String skillId, String taskId) {
    for (Skill skill in skills) {
      if (skill.id == skillId) {
        for (Task task in skill.tasks) {
          if (task.id == taskId) {
            setState(() {
              skill.increaseExpUsingTasks(taskId);
            });
          }
        }
      }
    }
  }

  void addSkill(Skill skill) {
    setState(() {
      skills.add(skill);
    });
  }

  void deleteSkill(String skillId) {
    setState(() {
      skills.removeWhere((element) => element.id == skillId);
    });
  }

  void deleteTask(String skillId, String taskId) {
    setState(() {
      for (Skill skill in skills) {
        if (skill.id == skillId) {
          skill.tasks.removeWhere((task) => task.id == taskId);
        }
      }
    });
  }

  void openNewSkillForm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewSkillForm(
        addSkill: addSkill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skill Tree"),
        actions: [
          IconButton(
            onPressed: openNewSkillForm,
            icon: const Icon(Icons.add_box_rounded),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...skills
                  .map((skill) => SkillCard(
                        skill: skill,
                        increaseExp: increaseExp,
                        deleteSkill: deleteSkill,
                        deleteTask: deleteTask,
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
