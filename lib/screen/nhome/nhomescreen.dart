import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoe/screen/cart/cubitaddcart/addcart_cubit.dart';
import 'package:shoe/screen/cart/cubitdeletecart/deletecart_cubit.dart';
import 'package:shoe/screen/nhome/cubit/banner_cubit.dart';
import 'package:shoe/screen/nhome/cubithome/home_cubit.dart';
import 'package:shoe/screen/nhome/model/BannnerModel.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:stylish_bottom_bar/helpers/constant.dart';

import '../Categories/category.dart';
import '../cart/cubitgetcaet/getcart_cubit.dart';
import '../cart/mycart.dart';
import '../const.dart';
import '../dblocallog/hivo.dart';
import '../diohelper/urlapi.dart';
import '../login/login_screen.dart';
import '../product/DetailsProduct.dart';
import '../profile/cubit/profile_cubit.dart';
import '../profile/profil.dart';
import 'detialsproduct.dart';
import 'model/HomeModel.dart';
bool fffcart=true;
class NhomeScreen extends StatefulWidget {
  const NhomeScreen({super.key});

  @override
  State<NhomeScreen> createState() => _NhomeScreenState();
}

class _NhomeScreenState extends State<NhomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().home();
    super.initState();
  }

  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  int gc = -1;int gd=-1;
  Color iconColor = Color.fromARGB(255, 74, 84, 176);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     List<Products>? h = [];
    return SideMenu(
        key: _endSideMenuKey,
        inverse: true,
        // end side menu
        type: SideMenuType.slideNRotate,
        menu: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: buildMenu(context),
        ),
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: SideMenu(
            background: Color.fromARGB(255, 74, 84, 176),
            key: _sideMenuKey,
            menu: buildMenu(context),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: IgnorePointer(
                ignoring: isOpened,
                child: Scaffold(
                  appBar: AppBar(
                      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                      bottomOpacity: 0.0,
                      elevation: 0.0,
                      centerTitle: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Image.asset(
                              'assets/images/Highlight_05.png',
                              width: 20,
                              height: 19,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Explore",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 44,
                                    color: Color.fromRGBO(43, 43, 43, 1)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      leading: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return InkWell(
                              child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/images/Hamburger.png',
                                ),
                              ),
                              onTap: () {
                                toggleMenu();
                                context.read<ProfileCubit>().profile();
                                setState(() {});
                              });
                        },
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: InkWell(
                            onTap: () {
                              context.read<GetcartCubit>().getcart();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Carts(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/bag-2.png',
                                width: 44,
                                height: 44,
                              ),
                              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ]),
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            cursorColor: Colors.blueGrey,
                            style: TextStyle(
                                color: Colors.blueGrey[700], fontSize: 18),
                            decoration: InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.search,
                                  color: Colors.grey),
                              hintText: 'What are you looking for?',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            // height: height*0.25,
                            width: double.infinity,
                            child: BlocBuilder<BannerCubit, BannerState>(
                              builder: (context, state) {
                                if (state is BannerLoading) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Container(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (state is BannerSuccess) {
                                  List<bannerdata>? images = context
                                      .read<BannerCubit>()
                                      .bannerModel
                                      .data;

                                  return CarouselSlider(
                                    options: CarouselOptions(
                                      height: height * 0.25,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.9,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.2,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                    items: images?.map((item) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        /* child: Image.network( item.image!,
                              fit: BoxFit.fill,),*/

                                        child: CachedNetworkImage(
                                          imageUrl: item.image!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor: Colors.white,
                                            child: Container(
                                              height: height * 0.25,
                                              width: double.infinity,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            'Recommended for you',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[900],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.36,
                            child: BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                if (state is HomeLoading) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 74, 84, 176),
                                  ));
                                } else if (state is HomeSucess) {
                                  h = context
                                      .read<HomeCubit>()
                                      .homeModel
                                      .data
                                      ?.products;
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Datasend.idproduct = index;
                                          Datasend.idddproduct = h?[index].id as int;


                                          fffcart=h![index].inCart!;
                                          Get.to(DetailsProducthome());
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: width * 0.02),
                                          padding: EdgeInsets.all(10),
                                          width: width * 0.5,
                                          height: height * 0.35,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl: '${h?[index].image}',
                                                width: width * 0.4,
                                                height: height * 0.2,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                  color: Color.fromARGB(
                                                      255, 74, 84, 176),
                                                )),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  Spacer(),
                                                  BlocBuilder<AddcartCubit,
                                                      AddcartState>(
                                                    builder: (context, state) {
                                                      if (state
                                                              is AddcartLoading &&
                                                          gc == index) {
                                                        return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                          color: Color.fromARGB(
                                                              255, 74, 84, 176),
                                                        ));
                                                      }
                                                      if (state
                                                      is AddcartLoading &&
                                                          gd == index) {
                                                        return Center(
                                                            child:
                                                            CircularProgressIndicator(
                                                              color: Color.fromARGB(
                                                                  255, 74, 84, 176),
                                                            ));
                                                      }
                                                      if (state
                                                              is AddcartSucces &&
                                                          gc == index) {
                                                        h?[index].inCart = true;
                                                        gc = -1;
                                                      }
                                                      if (state
                                                      is AddcartSucces &&
                                                          gd == index) {
                                                        h?[index].inCart = false;
                                                        gd = -1;
                                                      }




                                                          return CircleAvatar(
                                                            backgroundColor: h?[
                                                                            index]
                                                                        .inCart ==
                                                                    true
                                                                ? Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    84,
                                                                    176)
                                                                : Colors.white,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  // initState();
                                                                  if (h?[index]
                                                                          .inCart ==
                                                                      false) {
                                                                    gc=index;
                                                                    context
                                                                        .read<
                                                                            AddcartCubit>()
                                                                        .addcart(
                                                                            idnumber:
                                                                                h?[index].id as int);
                                                                  } else if(h?[index].inCart==true) {
                                                                    gd=index;
                                                                    print('*************${(h?[index].id)}');
                                                                    context
                                                                        .read<
                                                                        AddcartCubit>()
                                                                        .addcart(
                                                                        idnumber:
                                                                        h?[index].id as int);

                                                                  }
                                                                  //h?.clear();
                                                                  //context.read<HomeCubit>().home();
                                                                  /*print('******************************${h?[index]
                                                              .inCart}');*/
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_shopping_cart_outlined,
                                                                  color: h?[index]
                                                                              .inCart ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                )),
                                                          );
                                                        },

                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Text(
                                                '${h?[index].name}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              RichText(
                                                  text: TextSpan(
                                                      text: ' EGP ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      children: [
                                                    TextSpan(
                                                      text: '${h?[index].price}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ])),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: h?.length,
                                    scrollDirection: Axis.horizontal,
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: CurvedNavigationBar(
                    backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                    items: [
                      CurvedNavigationBarItem(
                        child: Icon(
                          CupertinoIcons.house,
                          color: iconColor,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(CupertinoIcons.heart, color: iconColor),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: iconColor,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(Icons.category_outlined, color: iconColor),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          CupertinoIcons.person,
                          color: iconColor,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      if (index == 2) {
                        Get.to((Carts()));
                      }
                      if (index == 3) {
                        Get.to((Category()));
                      }
                      if (index == 4) {
                        Get.to((Profile()));
                      }
                      setState(() {
                        iconColor = Color.fromARGB(255, 74, 84, 176);
                      }); // Handle button tap
                    },
                  ),
                ))));
  }
}

Widget buildMenu(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: picture1,
                  //width: 2,
                  // width: width * 0.2,
                  width: 150,
                  height: 130,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 74, 84, 176),
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 20.0),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    }
                    String? name =
                        context.read<ProfileCubit>().profileModel.data?.name;
                    return Text(
                      "Hey, ${name}",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    );
                  },
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
            leading: const Icon(Icons.person_outlined,
                size: 30.0, color: Colors.white),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Category()));
            },
            leading:
                const Icon(Icons.category, size: 30.0, color: Colors.white),
            title: const Text(
              "Category",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Carts(),
                ),
              );*/
              Get.to(Carts());
            },
            leading: const Icon(Icons.shopping_cart,
                size: 30.0, color: Colors.white),
            title: const Text(
              "My Cart",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.favorite, size: 30.0, color: Colors.white),
            title: const Text(
              "Favorite",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            onTap: () {
              StoragedataLogin.cleartoken();

              Get.offAll(LoginScreen());
            },
            leading: const Icon(Icons.logout, size: 20.0, color: Colors.white),
            title: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
