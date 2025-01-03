import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cart/cubitaddcart/addcart_cubit.dart';
import '../cart/mycart.dart';
import '../diohelper/urlapi.dart';
import '../product/detialscubit/detilas_cubit.dart';
import '../product/model/detailsproductmodel.dart';
import 'cubithome/home_cubit.dart';
import 'nhomescreen.dart';

class DetailsProducthome extends StatefulWidget {
  const DetailsProducthome({super.key});

  @override
  State<DetailsProducthome> createState() => _DetailsProducthomeState();

}

class _DetailsProducthomeState extends State<DetailsProducthome> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<DetilasCubit>().detilas(id:Datasend.idddproduct as int);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: width * 0.2,
        leading: Row(
          children: [
            SizedBox(
              width: width * 0.03,
            ),
            CircleAvatar(
              backgroundColor: Color(0xffF4F4F4),
              radius: 22,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 25,
                  color: Colors.black,
                ),
                color: Colors.black,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Carts(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 22,
                child: Image.asset(
                  'assets/images/bag-2.png',
                  width: 44,
                  height: 44,
                ),
                backgroundColor: Color(0xffF4F4F4),
              ),
            ),
          ),
        ],
        toolbarHeight: 90,

        //set your height
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              BlocBuilder<DetilasCubit, DetilasState>(
                builder: (context, state) {
                  if (state is DetilasLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ));
                  } else if (state is DetilasSucces) {
                    Data? dproductt = context.read<DetilasCubit>().detailsproductmodel.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          '${dproductt?.name}',
                          //  overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        RichText(
                            text: TextSpan(
                                text: ' EGP ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text:
                                    '${dproductt?.price}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl:
                            '${dproductt?.image}',
                            fit: BoxFit.fill,
                            //width: width * 0.4,
                            height: height * 0.4,
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 74, 84, 176),
                                )),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(

                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 0.15, width: width * 0.35,
                                //color: Colors.pink,
                                margin: EdgeInsets.all(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  '${dproductt!.images![index]}',
                                  fit: BoxFit.fill,
                                  //width: width * 0.4,
                                  height: height * 0.2,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Color.fromARGB(255, 74, 84, 176),
                                      )),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              );
                            },
                            itemCount: dproductt?.images?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,

                          ),
                          height: height*0.2,
                        ),
                        Text(
                          'Highlights',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          '${dproductt?.description}',
                          style:
                          TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
          //color: Color(0xff90A8BE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))
          // border: Border(
          //   top: BorderSide(
          //     color: Colors.indigo,
          //     width: 1,
          //   ),
          // ),

        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.05,
            ),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 74, 84, 176),
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.1,
            ),
            BlocBuilder<AddcartCubit, AddcartState>(
              builder: (context, state) {
                if (state is AddcartLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 74, 84, 176),
                      ));
                }

                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<AddcartCubit>()
                        .addcart(idnumber: Datasend.idddproduct as int);
                    fffcart=!fffcart;
                    context
                        .read<HomeCubit>()
                        .home();
                  },
                  child: Text(
                    fffcart?'Add to Cart':'Delete on cart',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 74, 84, 176), shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                    minimumSize: Size(width * 0.7, height * 0.06),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
