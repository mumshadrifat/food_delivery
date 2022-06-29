import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';


class PopularProductController extends GetxController {
  PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  ///private variable so that when I need to read it from ui
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  late CartController _cart;

  CartController get cartModel => _cart;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int _cartItems = 0;



  int get quantity => _quantity;
  int get cartItems => _cartItems + quantity;

  ///For Ui I need to this

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      print("got it");
      _popularProductList.addAll(
          Products.fromJson(response.body).products!.toList(growable: true));
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print(response.status);
    }
  }
//Add or Remove product ,===============================>

  void setQuantity(bool increment) {
    if (increment) {

      _quantity = checkQuantity(_quantity + 1);

      update();
    } else {
      _quantity = checkQuantity(_quantity - 1);
      update();
    }
  }

  int checkQuantity(int quantity) {
    if (quantity+_cartItems > 10) {
      Get.snackbar(
        "Item Count",
        "You can't add more items",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 10;
    } else if (_cartItems+quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduece more items",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else {
      return quantity;
    }
  }

  void initialData(ProductsModel product,CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;
    //if exis
    //Load from sources
    var exist=false;
    exist=_cart.ifExist(product);
    if(exist){
      _cartItems=_cart.getQuantity(product);
    }

  }
//Add to cart ===========================================================
  void addItem(ProductsModel product) {

      Get.snackbar(
        "Add Item",
        "${quantity}:"+"Item added into the cart",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      _cart.addItems(product, _quantity);
      _cartItems=_cartItems+_quantity;
      _quantity=0;
      print("Cart items==="+cartItems.toString());
      _cart.items.forEach((key, value) {
        print("Added item id:::"+value.id.toString()+"    quantity:::"+value.quantity.toString());
      });



  }
  int get totalQuantity{
    return _cart.totalQuantity;
  }
}
