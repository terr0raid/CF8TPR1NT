import 'package:cf8tpr1nt/core/base/model/i_base_error.dart';

class CustomError extends IBaseError {
  CustomError(super.message, super.code);

  @override
  String toString() {
    return 'CustomError{message: $message, code: $code}';
  }
}
