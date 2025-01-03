class PostCartModel {
  PostCartModel({
      this.status, 
      this.message, 
      this.data,});

  PostCartModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
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
      this.quantity, 
      this.product,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? id;
  num? quantity;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      this.id, 
      this.price, 
      this.oldPrice, 
      this.discount, 
      this.image, 
      this.name, 
      this.description,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}