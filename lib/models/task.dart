import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  Task({
    required this.name,
    required this.exp,
  });

  final String id = uuid.v4();
  final String name;
  final int exp;
}
