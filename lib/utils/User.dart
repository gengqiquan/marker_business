///auther:gengqiquan
///date:2019/1/31
///description:User
import 'package:shared_preferences/shared_preferences.dart';

///
class User {
  static String _token;
  static String _easemobAccount;
  static String _easemobPassword;
  static bool _login = false;

  static init(Map data) async {
    token = data["token"];
    easemobAccount = data["easemobAccount"];
    easemobPassword = data["easemobPassword"];
    login = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("easemobAccount", easemobAccount);
    await prefs.setString("easemobPassword", easemobPassword);
  }

  static  initByCache(Function done ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = prefs.get("token");
    if (token != null) {
      easemobAccount = prefs.get("easemobAccount");
      easemobPassword = prefs.get("easemobPassword");
      login = true;
      done();
    }
  }

  static String get token => _token;

  static set token(String value) {
    _token = value;
  }

  static bool get login => _login;

  static set login(bool value) {
    _login = value;
  }

  static String get easemobAccount => _easemobAccount;

  static set easemobAccount(String value) {
    _easemobAccount = value;
  }

  static String get easemobPassword => _easemobPassword;

  static set easemobPassword(String value) {
    _easemobPassword = value;
  }
}
