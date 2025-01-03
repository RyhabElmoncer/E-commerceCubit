import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:shoe/screen/Categories/category.dart';
import 'package:shoe/screen/Categories/cubit/category_cubit.dart';
import 'package:shoe/screen/cart/cubitaddcart/addcart_cubit.dart';
import 'package:shoe/screen/cart/cubitdeletecart/deletecart_cubit.dart';
import 'package:shoe/screen/cart/cubitgetcaet/getcart_cubit.dart';
import 'package:shoe/screen/cart/cubitupdatecaet/updatecart_cubit.dart';
import 'package:shoe/screen/dblocallog/hivo.dart';
import 'package:shoe/screen/diohelper/diohelper.dart';
import 'package:shoe/screen/login/cubit/login_cubit.dart';
import 'package:shoe/screen/nhome/cubit/banner_cubit.dart';
import 'package:shoe/screen/nhome/cubithome/home_cubit.dart';
import 'package:shoe/screen/nhome/nhomescreen.dart';
import 'package:shoe/screen/product/cubit/product_cubit.dart';
import 'package:shoe/screen/product/detialscubit/detilas_cubit.dart';
import 'package:shoe/screen/product/product.dart';
import 'package:shoe/screen/profile/cubit/profile_cubit.dart';
import 'package:shoe/screen/signup/cubit/sign_up_cubit.dart';
import 'package:shoe/screen/splach/splach.dart';


Future<void> main() async {
/*  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);*/
  await Hive.initFlutter();
  var box = await Hive.openBox(StoragedataLogin.login);
  DioHelper.init();
  //WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => SplachScreen);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => BannerCubit()..getbanners(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..getcategory(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()..getproduct(),
        ),
        BlocProvider(
          create: (context) => GetcartCubit()..getcart(),
        ),
        BlocProvider(
          create: (context) => AddcartCubit(),
        ),
        BlocProvider(
          create: (context) => UpdatecartCubit(),
        ),
        BlocProvider(
          create: (context) => DeletecartCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..home(),
        ),
        BlocProvider(
          create: (context) =>  DetilasCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.blue,
          //primarySwatch: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
