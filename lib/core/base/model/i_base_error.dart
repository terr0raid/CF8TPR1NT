abstract class IBaseError extends Error {
  IBaseError(this.message, this.code);
  final String? message;
  final String? code;
  @override
  String toString();
}
