import 'dart:ui';

abstract class ResourceState {}

class InitResource extends ResourceState {}

class LoadingResource extends ResourceState {}

class ResultResource<T> extends ResourceState {
  late T result;

  ResultResource({required this.result});
}

class SuccessResource extends ResourceState {}

class RefreshResource extends ResourceState {}

class ErrorResource extends ResourceState {
  String? error = "";
  final VoidCallback? callback;
  late Exception exception; //TODO:

  ErrorResource({this.error, this.callback}) {
    //TODO: show error
  }
}
