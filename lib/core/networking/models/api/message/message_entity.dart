class MessageEntity {
  MessageEntity({
    this.details,
    this.success = false,
    this.messages,
  });

  final List<dynamic>? details;
  final bool success;
  final String? messages;

  @override
  String toString() {
    return 'MessageEntity{details: $details, success: $success, messages: $messages}';
  }
}
