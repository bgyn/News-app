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
}
