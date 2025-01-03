class UpdateCartModel {
  UpdateCartModel({
      this.status, 
      this.message, 
      this.data,});

  UpdateCartModel.fromJson(dynamic json) {
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
      this.cart, 
      this.subTotal, 
      this.total,});

  Data.fromJson(dynamic json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    subTotal = json['sub_total'];
    total = json['total'];
  }
  Cart? cart;
  num? subTotal;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cart != null) {
      map['cart'] = cart?.toJson();
    }
    map['sub_total'] = subTotal;
    map['total'] = total;
    return map;
  }

}

class Cart {
  Cart({
      this.id, 
      this.quantity, 
      this.product,});

  Cart.fromJson(dynamic json) {
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
      this.image,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    return map;
  }

}