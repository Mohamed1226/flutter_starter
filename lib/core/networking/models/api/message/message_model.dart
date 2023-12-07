import 'package:ready_structure/core/networking/models/bases/base_model.dart';

class MessageModel extends BaseModel {
  MessageModel({
    this.details,
    this.success = false,
    this.messages,
  });

  final List<dynamic>? details;
  final bool success;
  final String? messages;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        details: json["details"] == null ? null : List<dynamic>.from(json["details"].map((x) => x)),
        success: json["success"] == null ? null : json["success"],
        messages: json["messages"] == null ? null : json["messages"],
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : List<dynamic>.from(details!.map((x) => x)),
        "success": success,
        "messages": messages == null ? null : messages,
      };

  @override
  String toString() {
    return 'MessageModel{details: $details, success: $success, messages: $messages}';
  }


}
