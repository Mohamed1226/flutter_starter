import 'package:ready_structure/core/networking/errors/base_error.dart';

class Result<Data> {
  final Data? data;
  final BaseError? error;

  Result({this.data, this.error}) : assert(data != null || error != null);

  bool get hasDataOnly => data != null && error == null;

  bool get hasErrorOnly => data == null && error != null;

  void when(
      {required void Function(Data data) onDataOnly,
      required void Function(BaseError error) onErrorOnly}) {
    if (hasDataOnly) {
      return onDataOnly(data!);
    }
    if (hasErrorOnly) {
      onErrorOnly(error!);
    }
  }

  @override
  String toString() {
    return 'Result{data: $data, error: $error}';
  }
}
