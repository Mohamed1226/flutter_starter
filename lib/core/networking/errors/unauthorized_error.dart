import 'package:ready_structure/core/networking/errors/base_error.dart';
import 'package:ready_structure/core/networking/models/api/message/message_model.dart';

class UnauthorizedError extends BaseError {
  UnauthorizedError(MessageModel? messageModel)
      : super("unauthorized_err", messageModel);
}
