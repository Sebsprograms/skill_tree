import 'package:flutter/material.dart';
import 'package:skill_tree/widgets/skills.dart';

const Color baseColor = Color.fromARGB(255, 207, 67, 11);
final lightColorScheme = ColorScheme.fromSeed(
  seedColor: baseColor,
);
final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: baseColor,
);

void main() {
  runApp(const SkillTree());
}

class SkillTree extends StatelessWidget {
  const SkillTree({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: lightColorScheme.onPrimaryContainer,
          backgroundColor: lightColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: darkColorScheme.onPrimaryContainer,
          backgroundColor: darkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      home: const Skills(),
    );
  }
}
