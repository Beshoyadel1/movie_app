import 'package:shared_preferences/shared_preferences.dart';

class ApiValue{
  static const String baseUrl='https://route-movie-apis.vercel.app';

  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }
}