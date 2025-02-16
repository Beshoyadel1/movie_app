import 'package:shared_preferences/shared_preferences.dart';

class ApiValue{
  static const String baseUrl='https://route-movie-apis.vercel.app';
  static const String movieItems='https://yts.mx/api/v2/list_movies.json?quality=3D';

  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }
}