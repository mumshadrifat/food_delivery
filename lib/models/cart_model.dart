class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel({this.id, this.name, this.price, this.img, this.quantity,
      this.isExist, this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'].toString();
    price = json['price'] as int?;
    img = json['img'].toString();
    quantity = json['quantity'] as int;
    isExist = json['isExist'] as bool;
    time=json['time'].toString();
  }
}