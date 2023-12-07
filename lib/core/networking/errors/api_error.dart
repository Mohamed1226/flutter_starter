import 'package:ready_structure/core/networking/models/api/message/message_model.dart';

import 'base_error.dart';

class ApiError extends BaseError {
  final MessageModel? messageModel;

  @override
  String get message => messageModel?.messages ?? '';

  const ApiError(this.messageModel) : super('');
}
