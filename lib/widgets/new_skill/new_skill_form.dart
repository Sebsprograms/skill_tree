import 'package:flutter/material.dart';
import 'package:skill_tree/widgets/new_skill/new_task.dart';

class NewSkillForm extends StatefulWidget {
  const NewSkillForm({super.key});

  @override
  State<NewSkillForm> createState() => _NewSkillFormState();
}

class _NewSkillFormState extends State<NewSkillForm> {
  final skillNameController = TextEditingController();

  @override
  void dispose() {
    skillNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: skillNameController,
            decoration: const InputDecoration(
              hintText: "Skill Name",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("Tasks"),
          const SizedBox(
            height: 8,
          ),
          NewTask(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
