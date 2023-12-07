import 'package:ready_structure/core/networking/models/api/api_response_model.dart';
import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';

class VoidApiResponse extends BaseApiDataModel {
  final String? successMessage;
  static ResponseConverter<VoidApiResponse> converter = (json, [_]) => const VoidApiResponse();

  // (json, [_]) => VoidApiResponse.fromJson(json)
  const VoidApiResponse({this.successMessage});

  @override
  Map<String, dynamic> toJson() => {};
}


