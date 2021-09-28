import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._internal();
  late SharedPreferences _local;
  static final LocalStorage _localStorage = LocalStorage._internal();

  factory LocalStorage() => _localStorage;

  initPrefs() async {
    this._local = await SharedPreferences.getInstance();
  }

  String get userToken => _local.getString('user_token') ?? '';

  set userToken(String value) => _local.setString('user_token', value);

  void clear() {
    userToken = ('');
  }
}
