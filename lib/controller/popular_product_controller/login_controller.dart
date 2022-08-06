import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
import 'package:food_delivery/data/repository/login_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/auth_response_model.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/login_model.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class LoginController extends GetxController implements GetxService {
  final LoginRepo loginRepo;

  LoginController({required this.loginRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

 Future<AuthResponseModel> login(LoginModel loginModel) async {
    _isLoading = true;
    late AuthResponseModel authResponseModel;
    Response response = loginRepo.getLogin(loginModel) as Response;
    if (response.statusCode == 200) {
      //Save token in sharedPref==>
      print("success");
      loginRepo.saveUserToken(response.body["token"]);
      authResponseModel = AuthResponseModel(true, response.body["token"]);
    } else {
      authResponseModel = AuthResponseModel(false, response.statusText);
      print("success");
    }
    update();
    return authResponseModel;
  }

/*  callLoginApi() {
    final service = ApiServices();

    service.apiCallLogin(
      {
        "email": emailText.text,
        "password": passwordText.text,
      },
    ).then((value){
      if(value.error != null){
        print("get data >>>>>> " + value.error!);
      }else{
        print(value.token!);
        //push
      }
    });

  }*/

}
