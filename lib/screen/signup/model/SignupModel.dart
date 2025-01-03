class SignupModel {
  SignupModel({
      this.status, 
      this.message, 
      this.data,});

  SignupModel.fromJson(dynamic json) {
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
      this.name, 
      this.phone, 
      this.email, 
      this.id, 
      this.image, 
      this.token,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }
  String? name;
  String? phone;
  String? email;
  num? id;
  String? image;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['id'] = id;
    map['image'] = image;
    map['token'] = token;
    return map;
  }

}