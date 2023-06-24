import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  Task({
    this.name = "",
    this.exp = 0,
  });

  final String id = uuid.v4();
  final nameController = TextEditingController();
  final expController = TextEditingController();
  String name;
  int exp;
}
