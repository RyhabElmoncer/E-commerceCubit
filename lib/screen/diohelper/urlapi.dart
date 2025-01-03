class ApiUrl{

  static const baseUrl ="https://student.valuxapps.com/api/";
  static const login = "login";
  static const home = "home";
  static const register = "register";
  static const banners = "banners";
  static const category = "categories";
  static String product = "categories/${Datasend.idcategory}";
  static const profile="profile";
  static const cart="carts";
  static const upcart="carts/";
  static String message='';
  static String messageup='';
/*  static List<Map<String,String>>pro=[
    {
      'name':"",
      'email':"",
      'phone':"",
      'image':"",
    }
  ];*/


}
class Datasend{
  static late  String ?namecategory;
  static late num ?idcategory;
  static late int ?idproduct;
  static late int ?idddproduct;
}
/*
class Profileee{
   late String ?name;
   late String ?email;
   late String ?phone;
  Profileee({  this.name,  this.email,  this.phone});
}*/
