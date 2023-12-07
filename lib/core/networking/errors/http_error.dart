import '../models/api/message/message_model.dart';
import 'base_error.dart';

class HttpError extends BaseError {
  final MessageModel _messageModel;

  @override
  String get message => _messageModel.messages ?? '';

  const HttpError(this._messageModel) : super('');

  factory HttpError.fromDynamic(Object? object) =>
      HttpError(MessageModel(success: false, messages: '$object'));
}
