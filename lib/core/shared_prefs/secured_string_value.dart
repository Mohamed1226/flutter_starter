import 'secure_shared_prefs.dart';

class SecureStringValue {
  final String key;
  final String? defaultValue;

  SecureStringValue(this.key, {this.defaultValue});

  String? _val;

  String? get val => _val ?? defaultValue;

  Future<void> fetch() async {
    final fetchedValue = (await SecureSharedPrefs.ssp.read(key: key));
    _val = fetchedValue;
  }

  Future<void> setValue(String? value) async {
    _val = value;
    await SecureSharedPrefs.ssp.write(key: key, value: value);
  }

  Future<void> deleteValue() async {
    _val = null;
    await SecureSharedPrefs.ssp.delete(key: key);
  }
}
