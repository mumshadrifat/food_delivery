import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
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
  bool _isLoaded = false;
  late CartController _cart;

  bool get isLoaded => _isLoaded;
  int _cartItems = 0;
  bool increment = false;
  int _quantity = 0;

  int get quantity => _quantity;

  int get cartItems => _cartItems + _quantity;

  ///For Ui I need to this

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];

      _recommendedProductList.addAll(
          RecommendedProductModel.fromJson(response.body)
              .products!
              .toList(growable: true));
      print("Recommended");
      _isLoaded = true;
      update();
    } else {
      print("Not loaded");
      print(response.status);
    }
  }

  void initialData(RecommendedProducts product, CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;

    //if exis
    //Load from sources
    var exist = false;
    exist = _cart.ifExistRecom(product);
    if (exist) {
      _cartItems = _cart.getQuantityRecom(product);
    }
  }

  void addItem(RecommendedProducts product) {
    _cart.addItemsRecom(product, quantity);
    Get.snackbar(
      "Add Item",
      "${quantity}:" + "Items added into the cart",
    );
    _cartItems = _cartItems + _quantity;
    _quantity = 0;
    print("Cart items==="+cartItems.toString());
    _cart.items.forEach((key, value) {
      print("Added item id:::"+value.id.toString()+"    quantity:::"+value.quantity.toString());
    });
      update();
  }

  void setQuantity(bool increment) {
    if (increment) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);

      print("cartItems");
      print(cartItems);
      print("quantity");
      print(quantity);

    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_cartItems + quantity > 10) {
      Get.snackbar("Add Items", "You can't Add more");
      return 10;
    } else if (_cartItems + quantity < 0) {
      Get.snackbar("Add items", "You can't reduce more");


      return _quantity;
    } else {
      print("Another _cartItems");
      print(_cartItems);
      return quantity;
    }
  }
  int get totalQuantity{
    return _cart.totalQuantity;
  }
}
