import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:get/get.dart';

import '../../data/repository/recommended_product_repo.dart';
import '../../models/recommended_product_model.dart';

class RecommendedProductController extends GetxController {
  RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  ///private variable so that when I need to read it from ui
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  ///For Ui I need to this

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];

      _recommendedProductList.addAll(
          RecommendedProductModel.fromJson(response.body).products!.toList(growable: true));
       print("Recommended");
      _isLoaded=true;
      update();
    } else {
      print("Not loaded");
      print(response.status);
    }
  }
}
