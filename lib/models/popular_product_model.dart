class Products {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  List<ProductsModel>? _products;
  List<ProductsModel>? get products=>_products;

  Products({required totalSize, required typeId,required offset, required products}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
  }

  Products.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size']as int;
    _typeId = json['type_id']as int;
    _offset = json['offset']as int;
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add( ProductsModel.fromJson(v));
      });
    }
  }


}
class ProductsModel {
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

  ProductsModel(
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

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'].toString();
    description = json['description'].toString();
    price = json['price'] as int?;
    stars = json['stars'] as int?;
    img = json['img'].toString();
    location = json['location'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    typeId = json['type_id']as int?;
  }


}