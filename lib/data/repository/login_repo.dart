import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/login_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo extends GetxService{
  late final ApiClient apiClient;


  LoginRepo({  required this.apiClient});

  Future<Response> getLogin(LoginModel loginModel){
    return  apiClient.getLogin("/api/login",loginModel.toJson());
  }

  /* saveUserToken(String token) {

    apiClient.token=token;
    apiClient.updateHeader(token);
    return sharedPreferences.setString(AppConstants.TOKEN,token);
   }*/


}