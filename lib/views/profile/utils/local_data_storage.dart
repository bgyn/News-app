import 'package:news_app/states/shared_preference/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage {
  storeInfomation(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("PersonalInfo", data);
  }

  Future<String> getInformation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("PersonalInfo") ?? "";
  }

  isNewUser(bool data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(newUser, data);
  }

}
