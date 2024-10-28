import 'package:quizify/data/service/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Instance of SharedPreferences to persist data locally
  late final SharedPreferences _prefs;

  // Initializes the SharedPreferences instance.
  // This method must be called before accessing other methods.
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // Sets a boolean value in SharedPreferences for the given [key].
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  // Sets a string value in SharedPreferences for the given [key].
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // Retrieves the stored boolean value for `deviceFirstOpen`.
  // Returns `false` if no value is found, indicating the device has opened before.
  bool getDeviceFirstOpen() {
    return _prefs.getBool(StorageConstants.deviceFirstOpen) ?? false;
  }

  // Retrieves the stored string value for `userToken`.
  // Returns `null` if no value is found, indicating the user is not logged in.
  bool getIsLoggedIn() {
    return _prefs.getString(StorageConstants.userToken) == null ? false : true;
  }

  // Removes the value for the given [key] from SharedPreferences.
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
