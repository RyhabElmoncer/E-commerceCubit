class Detailsproductmodel {
  Detailsproductmodel({
      this.status, 
      this.message, 
      this.data,});

  Detailsproductmodel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.price, 
      this.oldPrice, 
      this.discount, 
      this.image, 
      this.name, 
      this.description, 
      this.inFavorites, 
      this.inCart, 
      this.images,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    map['in_favorites'] = inFavorites;
    map['in_cart'] = inCart;
    map['images'] = images;
    return map;
  }

}