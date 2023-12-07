import 'dart:convert';

import 'package:ready_structure/core/networking/models/api/message/message_model.dart';
import 'package:ready_structure/core/networking/models/bases/base_model.dart';

typedef T ResponseConverter<T>(Map<String, dynamic> json, [int? totalRows]);
typedef T GeneralResponseConverter<T>(Map<String, dynamic> json);

/// General response coming from API
///
/// - 'D' is data model [BaseApiDataModel]
class ApiResponseModel<D extends BaseModel> {
  ApiResponseModel({
    this.data,
    required this.message,
  });

  static MessageModel parseMessage(Map<String, dynamic> json) {
    return json["message"] == null
        ? MessageModel(success: false, messages: "unknown_error")
        : MessageModel.fromJson(json["message"]);
  }

  final MessageModel message;
  final D? data;

  factory ApiResponseModel.fromJson(
          Map<String, dynamic> json, ResponseConverter<D> converter) =>
      ApiResponseModel(
        data: json["data"] == null
            ? null
            : (json["data"] is List
                ? converter({
                    'items': json["data"],
                    "additionalData": json["additionalData"] ?? null
                  }, json["totalRows"])
                : (json["data"] is Map<String, dynamic>
                    ? converter(json["data"])
                    : converter({'val': json["data"]}))),
        message: parseMessage(json),
      );

  factory ApiResponseModel.fromRawJson(response,
      {required ResponseConverter<D> converter}) {
    var decodedJson;

    if (response?.data is String) {
      // log('response.data length ${response.data.length}');
      decodedJson = json.decode(response.data);
    } else
      decodedJson = response.data;
    return ApiResponseModel.fromJson(decodedJson, converter);
  }
}
