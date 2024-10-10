import 'package:activities_api/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'activity.g.dart';

// Represents an Activity
@immutable
@JsonSerializable()
class Activity extends Equatable {
  /// Creates a new [Activity]
  ///
  /// The [title] is required
  /// If no [id] is provided, a new unique ID will be generated.
  /// [linkedSkills] are empty by default
  Activity({
    required this.title,
    String? id,
    this.linkedSkills = const [],
    this.cooldown = const Duration(minutes: 30),
    this.lastUsed,
  })  : assert(id == null || id.isNotEmpty, 'id should be null or empty'),
        id = id ?? Uuid().v4();

  /// Unique identified for the Activity
  final String id;

  /// Title of the Activity
  final String title;

  /// Linked skills of the Activity
  ///
  /// These will be used to score XP on one or multiple skills
  final List<ActivityLinkedSkill> linkedSkills;

  /// A cooldown duration after performing an activity
  final Duration cooldown;

  /// A timestamp when the activity was last performed.
  final DateTime? lastUsed;

  /// Check whether the activity is still on cooldown.
  bool get isOnCooldown {
    if (lastUsed == null) return false;

    // Calculate the time difference from now.
    final timeSinceLastUsed = DateTime.now().difference(lastUsed!);

    // Return true if the cooldown period hasn't expired yet.
    return timeSinceLastUsed < cooldown;
  }

  @override
  List<Object?> get props => [];

  /// Converts a JSON map into a [Activity] instance.
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  /// Converts the [Activity] instance into a JSON map.
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
