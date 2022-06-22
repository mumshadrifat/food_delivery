import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  late final ApiClient apiClient;

  RecommendedProductRepo( { required this.apiClient});

  Future<Response> getRecommendedProductList(){
    return  apiClient.getData("/api/v1/products/recommended");
  }


}