


import '../app_localization/app_localization.dart';
import 'base_validators.dart';

class RequiredValidator extends BaseValidator {
  @override
  String getMessage() {
    return AppLocalize.gen.v_required;
  }

  @override
  bool validate(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  bool validateNotNull(Object? value) {
    return value != null;
  }
}
