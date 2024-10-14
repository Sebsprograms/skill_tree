import 'package:flutter/material.dart';
import 'package:skill_tree/create_activity/view/create_activity_page.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivitiesView();
  }
}

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CreateActivityPage(),
              );
            },
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_circle,
          size: 40,
        ),
      ),
    );
  }
}
