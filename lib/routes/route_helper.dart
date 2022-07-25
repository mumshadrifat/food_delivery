import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food.dart';
import 'package:food_delivery/pages/home/food_page.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String initial = "/";
  static String popularFood = "/popular-food";
  static String recommendedFood = "/recommended-food";
  static String cart = "/cart-page";

  static String getInitial() => '$initial';

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static String getCartPage() => '$cart';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MyHomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetails(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetails(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: cart,
        page: () {
          return Cart();
        })
  ];
}
