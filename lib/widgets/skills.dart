import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  Skills({super.key});

  @override
  State<Skills> createState() {
    return _SkillsState();
  }
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skill Tree"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test Text"),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Test Button")),
            SizedBox(
              height: 12,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Test card"),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Text Button"),
            ),
          ],
        ),
      ),
    );
  }
}
