import 'data/base_api_model.dart';

class SimpleValue<D> extends BaseApiDataModel {
  final D val;

  SimpleValue(this.val);

  factory SimpleValue.fromJson(Map<String, dynamic> json) => SimpleValue(json['val']);

  @override
  Map<String, dynamic> toJson() => {};
}
