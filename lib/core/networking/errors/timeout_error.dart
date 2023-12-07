import 'package:ready_structure/core/networking/errors/base_error.dart';

class TimeoutError extends BaseError {
  TimeoutError() : super("timeout_err");
}
