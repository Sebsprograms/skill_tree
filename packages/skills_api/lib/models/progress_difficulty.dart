/// Represents different difficulty levels for progress tracking.
///
/// Each difficulty level has a corresponding label and a hex color code.
enum ProgressDifficulty {
  /// Represents a very easy difficulty level with a green color.
  veryEasy('Very Easy', '#00FF00'), // Green

  /// Represents an easy difficulty level with a light green color.
  easy('Easy', '#90EE90'), // Light Green

  /// Represents a medium difficulty level with an orange color.
  medium('Medium', '#FFA500'), // Orange

  /// Represents a hard difficulty level with a red color.
  hard('Hard', '#FF0000'), // Red

  /// Represents a very hard difficulty level with a dark red color.
  veryHard('Very Hard', '#8B0000'); // Dark Red

  /// Constructs a [ProgressDifficulty] with the given [label] and [colorCode].
  const ProgressDifficulty(this.label, this.colorCode);

  /// The human-readable label for the difficulty level.
  final String label;

  /// The hex color code representing the difficulty level.
  final String colorCode;

  /// Returns the string representation of the difficulty level.
  ///
  /// This is the same as the [label] field.
  @override
  String toString() => label;

  /// Converts a [String] to a [ProgressDifficulty].
  ///
  /// Throws an [ArgumentError] if the provided [label] does not match any
  /// difficulty level.
  static ProgressDifficulty fromString(String label) {
    return ProgressDifficulty.values.firstWhere(
      (difficulty) => difficulty.label.toLowerCase() == label.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid difficulty label: $label'),
    );
  }
}
