import 'package:flutter_muhamad_app_siakad/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<bool> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('auth', data.toJson());
    return result;
  }

  Future<bool> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.remove('auth');
    return result;
  }

  //ambil token
  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';
    if (jsonString.isEmpty) {
      return '';
    }
    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.jwtToken;
  }

  //posisi dia sedang login atau tidak
  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    //tinggal kita cek
    return authJson.isNotEmpty;
  }

  //get user
  Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';

    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.user;
  }
}
