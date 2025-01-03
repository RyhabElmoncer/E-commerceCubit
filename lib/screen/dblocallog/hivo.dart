import 'package:hive/hive.dart';

class StoragedataLogin{
  static const login='login';
  static var mybox=Hive.box(login);

  static Future<void> addtoken(String text) async {
    await mybox.put(login, text);

  }
  static String gettoken() {
    if(mybox.isNotEmpty)  return mybox.get(login);
    else return "";
  }
  static void cleartoken(){
    mybox.clear();
  }


}