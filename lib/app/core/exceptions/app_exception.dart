/// This class represents all the exceptions that can be thrown.
/// 
/// All the specific exceptions should extend from this one.
base class AppException implements Exception {
  final String message;

  final StackTrace? stackTrace;

  /// A description of the step that the app was doing.
  final String? step;

  const AppException(
    this.message, {
    this.stackTrace,
    this.step,
  });
}
