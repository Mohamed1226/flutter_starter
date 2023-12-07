import '../models/api/message/message_model.dart';
import 'base_error.dart';

class ForbiddenError extends BaseError {
  ForbiddenError([MessageModel? messageModel])
      : super("ForbiddenError", messageModel);
}
