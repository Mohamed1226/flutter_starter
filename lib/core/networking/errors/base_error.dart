import '../models/api/message/message_model.dart';

abstract class BaseError {
  final String _message;

  String get message => messageModel?.messages ?? _message;

  final MessageModel? messageModel;

  const BaseError(this._message, [this.messageModel]);
}
