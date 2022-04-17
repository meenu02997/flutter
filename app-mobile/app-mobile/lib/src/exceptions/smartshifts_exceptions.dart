class SmartShiftException implements Exception {
  const SmartShiftException([this.message = '']);

  final String message;

  // function to print exceptions logs
  @override
  String toString() => 'SmartShifts App Exception: $message';
}
