
import 'base_validators.dart';

class QuantityValidator extends BaseValidator {
  final double quantity;

  QuantityValidator({required this.quantity});

  @override
  String getMessage() {
    return "الكميه اكثر من الموجود في المخزن";
  }

  @override
  bool validate(String? value) {
    return value != null && double.tryParse(value) !=null&&(double.parse(value) <= quantity);
  }
}
