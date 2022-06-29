import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> items = {};

  void addItems(ProductsModel products, int quantity) {
    if (items.containsKey(products.id)) {
      var totalQuantity = 0;
      items.update(products.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
      if (totalQuantity <= 0) {
        items.remove(products.id!);
      }
    } else {
      if (quantity > 0) {
        items.putIfAbsent(
            products.id!,
            () => CartModel(
                id: products.id,
                name: products.name,
                price: products.price,
                img: products.img,
                quantity: quantity,
                isExist: true,
                time: DateTime.now().toString()));
      } else {
        Get.snackbar("Add Items", "Add At least one");
      }
    }
  }

  bool ifExist(ProductsModel product) {
    if (items.containsKey(product.id)) {
      return true;
    }
    ;
    return false;
  }

  int getQuantity(ProductsModel product) {
    var quantity = 0;
    if (items.containsKey(product.id)) {
      items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalQuantity {
    var totalQuanity = 0;
    items.forEach((key, value) {
      totalQuanity = totalQuanity + value.quantity!;
    });
    return totalQuanity;
  }
}
