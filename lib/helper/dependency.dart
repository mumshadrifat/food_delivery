import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller/login_controller.dart';
import 'package:food_delivery/controller/popular_product_controller/popular_product_controller.dart';
import 'package:food_delivery/controller/popular_product_controller/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/login_repo.dart';

Future <void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // api client
 // Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://reqres.in"));


  //Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => CartRepo());
  Get.lazyPut(() =>LoginRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo:Get.find()));
  Get.lazyPut(() => LoginController(loginRepo: Get.find()));

}