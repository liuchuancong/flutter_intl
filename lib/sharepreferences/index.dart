import 'package:shared_preferences/shared_preferences.dart';

Future setSession(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
Future setBoolSession(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}
Future getSession(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = prefs.get(key);
  return string;
}
Future getBoolSession(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   bool res = prefs.getBool(key);
  return res;
}
Future removeSession(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}