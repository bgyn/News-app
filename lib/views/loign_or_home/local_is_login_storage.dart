import 'package:news_app/states/shared_preference/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalIsLoginStoreage {
  storeIsLogin(bool data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(isloggedIn, data);
  }
}
