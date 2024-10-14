import 'package:activities_api/activities_api.dart';
import 'package:flutter/material.dart';

class CreateActivityPage extends StatelessWidget {
  const CreateActivityPage({
    this.initialActivity,
    super.key,
  });

  final Activity? initialActivity;

  @override
  Widget build(BuildContext context) {
    return CreateActivityView(
      initialActivity: initialActivity,
    );
  }
}

class CreateActivityView extends StatelessWidget {
  const CreateActivityView({this.initialActivity, super.key});
  final Activity? initialActivity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Placeholder(),
    );
  }
}
