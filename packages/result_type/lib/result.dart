/// Result type, with `value` or `error`.
class Result<T> {
  /// Optional result `value`, if the result represents a success
  final T? value;

  /// Optional error message, if the result represents an error.
  final String? error;

  /// Creates result representing a `value` or `error`.
  const Result({
    this.value,
    this.error,
  });

  bool get hasValue => value != null;
  bool get hasNoValue => value == null;

  bool get hasError => error != null;
  bool get hasNoError => error == null;
}
