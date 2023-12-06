
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSharedPrefs {
  SecureSharedPrefs._();

  static FlutterSecureStorage ssp = const FlutterSecureStorage();

  static Future<void> clear() {
    return ssp.deleteAll();
  }
}
