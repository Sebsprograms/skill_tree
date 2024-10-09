import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:tasks_api/models/task_linked_skill.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

/// Represents a task
@immutable
@JsonSerializable()
class Task extends Equatable {
  /// Creates a new [Task]
  ///
  /// The [title] is required
  /// If no [id] is provided, a new unique ID will be generated.
  /// [description] and [linkedSkills] are empty by default
  /// [isComplete] is false initially
  Task({
    required this.title,
    String? id,
    this.description = '',
    this.linkedSkills = const [],
    this.isComplete = false,
  })  : assert(id == null || id.isNotEmpty, 'id should be null or empty'),
        id = id ?? Uuid().v4();

  /// Unique identified for the task
  final String id;

  /// Title of the task
  final String title;

  /// Description of the task
  final String description;

  /// Linked skills of the task
  ///
  /// These will be used to score XP on one or multiple skills
  final List<TaskLinkedSkill> linkedSkills;

  /// check to see if a task is completed
  final bool isComplete;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        linkedSkills,
        isComplete,
      ];

  /// Converts a JSON map into a [Task] instance.
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Converts the [Task] instance into a JSON map.
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
