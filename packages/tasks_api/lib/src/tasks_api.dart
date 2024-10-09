import 'package:tasks_api/models/task.dart';

/// The interface for an API providing access to Tasks
abstract class TasksApi {
  /// Creates an instance of the [TasksApi]
  const TasksApi();

  /// Stream of Tasks
  Stream<List<Task>> getTasks();

  /// Stream of Tasks related to a skill
  Stream<List<Task>> getTasksRelatedToSkill(String skillId);

  /// Delete a Task
  Future<void> deleteTask(String id);

  /// Delete all completed Tasks
  Future<void> deleteCompletedTasks();

  /// Save a task
  Future<void> saveTask(Task task);

  /// Close the connection to the API
  Future<void> close();
}
