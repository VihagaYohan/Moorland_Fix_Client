import 'package:encrypt_shared_preferences/provider.dart';

class EncryptStorage {
  late EncryptedSharedPreferences sharedPreference;

  EncryptStorage._(this.sharedPreference);

  static Future<EncryptStorage> create() async {
    await EncryptedSharedPreferences.initialize("0774728480754539");
    final instance = EncryptedSharedPreferences.getInstance();
    return EncryptStorage._(instance);
  }

  // set values
  Future<void> setValue<T>(String key, T payload) async {
    if(T == String) {
      await sharedPreference.setString(key, payload as String);
    }

    if(T == bool) {
      await sharedPreference.setBool(key, payload as bool);
    }
  }

  // get value
  Future<T?> getValue<T>(String key) async {
    if(T == String) {
      return sharedPreference.getString(key) as T;
    }

    if(T == bool) {
      return sharedPreference.getBool(key) as T;
    }
  }
}