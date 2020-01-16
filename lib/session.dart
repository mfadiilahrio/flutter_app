import 'package:core/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  getStringSessionValue(String sessionName) async {
    final prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(sessionName) ?? "";
    return stringValue;
  }

  Future<bool> getBooleanSessionValue(String sessionName) async {
    final prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(sessionName) ?? false;
    return boolValue;
  }

  setStringSession(String sessionName, String sessionValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionName, sessionValue);
  }

  setBooleanSession(String sessionName, bool sessionValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(sessionName, sessionValue);
  }

  removeSession(String sessionName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sessionName);
  }

  logout() {
    removeSession(SESSION_USER_NAME);
    removeSession(SESSION_IS_LOGIN);
  }
}