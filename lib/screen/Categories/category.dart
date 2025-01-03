import 'dart:ffi';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoe/screen/Categories/cubit/category_cubit.dart';
import 'package:shoe/screen/Categories/model/CategoryModel.dart';
import 'package:shoe/screen/product/product.dart';

import '../diohelper/urlapi.dart';
import '../product/cubit/product_cubit.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    // TODO: implement initState
    CategoryCubit().getcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              CircleAvatar(
                backgroundColor: Color(0xffF4F4F4),
                radius: 25,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Shop by Categories',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              //SizedBox(height: height*0.009,),
              Expanded(
                // height: height*0.635,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 74, 84, 176),
                      ));
                    } else if (state is CategorySucess) {
                      List<CategoryData>? images = context
                          .read<CategoryCubit>()
                          .categoryModel
                          .data
                          ?.data;

                      print(images![0].name);
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: height * 0.11,
                                  width: width * 0.9,
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.01),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF4F4F4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: CachedNetworkImage(
                                            imageUrl: '${images[index].image}',
                                            width: width * 0.2,
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
                                        ),
                                        SizedBox(
                                          width: width * 0.06,
                                        ),
                                        Text(
                                          '${images[index].name}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Datasend.idcategory = images[index].id;
                                  Datasend.namecategory = images[index].name;

                                  ApiUrl.product =
                                      'categories/${images[index].id}';

                                  Get.to(Product());
                                },
                              ),
                            ],
                          );
                          return null;
                        },
                        itemCount: images.length,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
