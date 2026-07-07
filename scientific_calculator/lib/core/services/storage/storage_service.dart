import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveTheme(
    bool isDark,
  ) async {
    final preferences =
        await SharedPreferences.getInstance();

    await preferences.setBool(
      'isDark',
      isDark,
    );
  }

  Future<bool> loadTheme() async {
    final preferences =
        await SharedPreferences.getInstance();

    return preferences.getBool('isDark') ?? false;
  }
}