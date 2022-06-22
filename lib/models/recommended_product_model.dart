class RecommendedProductModel {
  int? totalSize;
  int? typeId;
  int? offset;
  List<RecommendedProducts>? _products;
  List<RecommendedProducts>? get products=>_products;

  RecommendedProductModel(
      {required totalSize,required typeId, required offset, required products});

  RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    typeId = json['type_id'];
    offset = json['offset'];
    if (json['products'] != null) {
      _products = <RecommendedProducts>[];
      json['products'].forEach((v) {
        products!.add(new RecommendedProducts.fromJson(v));
      });
    }
  }


}

class RecommendedProducts {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  RecommendedProducts(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  RecommendedProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }


}