
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/screen/cart/cubitdeletecart/deletecart_cubit.dart';
import 'package:shoe/screen/cart/cubitupdatecaet/updatecart_cubit.dart';
import 'package:shoe/screen/nhome/cubithome/home_cubit.dart';
import '../diohelper/diohelper.dart';

import '../nhome/nhomescreen.dart';
import '../product/cubit/product_cubit.dart';
import 'cubitgetcaet/getcart_cubit.dart';
import 'model/ShowCartModel.dart';

const List<String> list = <String>['1', '2', '3', '4', '5', '6', '7'];
double delivery=60.0;
class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  void initState() {
    context.read<GetcartCubit>().getcart();

  }

  String dropdownValue = list.first;
  int weight = 1;
  double tot = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int j=-1;int jd=-1;num sub=0;
    num total=0.0;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 19, color: Color.fromRGBO(43, 43, 43, 1)),
        ),
        leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
               /* context
                    .read<ProductCubit>()
                    .getproduct();
                context
                    .read<HomeCubit>()
                    .home();*/

              },
              child: CircleAvatar(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.grey,
                ),
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<GetcartCubit, GetcartState>(
          builder: (context, state) {
            if (state is GetcartLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 74, 84, 176),
              ));
            } else if (state is GetcartSucess) {


              var hh = context.read<GetcartCubit>().showCartModel.data;
              total=hh!.total!;
              sub=hh.subTotal!;
              List<CartItems>? cartdata =hh.cartItems;

              print('**********************${cartdata?.length}');
              return BlocBuilder<DeletecartCubit, DeletecartState>(
  builder: (context, state) {
    if(state is DeletecartSucces){
      if (jd !=-1){
        cartdata?.removeAt(jd);
        jd=-1;

        context
            .read<HomeCubit>()
            .home();
      }
      context
          .read<ProductCubit>()
          .getproduct();
    }
    return ListView.builder(
                itemCount: cartdata?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: height * 0.27,
                                    width: width * 0.9,
                                    margin: EdgeInsets.only(bottom: height * 0.03),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 234, 233, 233),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: height * 0.17,
                                              margin: EdgeInsets.only(
                                                  top: height * 0.00, left: width * 0.04),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${cartdata?[index].product?.image}',
                                                width: width * 0.35,
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
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                BlocBuilder<UpdatecartCubit, UpdatecartState>(
                                                  builder: (context, state) {
                                                    if (state is UpdatecartLoading&&j==index) {

                                                      return Center(
                                                          child: CircularProgressIndicator(
                                                        color:
                                                            Color.fromARGB(255, 74, 84, 176),
                                                      ));
                                                    }
                                                    else if(state is UpdatecartSucess&&j==index){
                                                      var oo=context.read<UpdatecartCubit>().updateCartModel.data;
                                                      print(index);
                                                      cartdata?[index].quantity  =oo?.cart?.quantity;

                                                      j=-1;
                                                    }


                                                    return DropdownMenu<String>(
                                                      //enabled: false,
                                                      width: width * 0.2,

                                                      onSelected: (String? value) {
                                                        j=index;
                                                        context
                                                            .read<UpdatecartCubit>()
                                                            .updatecart(
                                                                id: cartdata?[index].id
                                                                    as int,
                                                                quantity: num.parse(
                                                                    value.toString()));


                                                     //   cartdata?[index].quantity  =context.read<UpdatecartCubit>().updateCartModel.data?.cart?.quantity;

                                                        /* context
                                                            .read<GetcartCubit>()
                                                            .getcart();*/
                                                      },

                                                      initialSelection: cartdata?[index]
                                                          .quantity
                                                          .toString(),
                                                      dropdownMenuEntries: list
                                                          .map<DropdownMenuEntry<String>>(
                                                              (String value) {
                                                        return DropdownMenuEntry<String>(
                                                            value: value, label: value);
                                                      }).toList(),
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                BlocBuilder<DeletecartCubit, DeletecartState>(
                                                  builder: (context, state)  {
                                                    if (state is DeletecartLoading&&jd==index) {

                                                      return Center(
                                                          child: CircularProgressIndicator(
                                                        color:
                                                            Color.fromARGB(255, 74, 84, 176),
                                                      ));

                                                    }

                                                    return CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(255, 234, 233, 233),
                                                      radius: 25,
                                                      child: IconButton(
                                                        iconSize: 30,
                                                        icon: Icon(CupertinoIcons.delete,
                                                            color: Colors.grey[600]),
                                                        onPressed: () {
                                                          /*context
                                                              .read<GetcartCubit>()
                                                              .getcart();*/

                                                          //print(cartdata?.length);
                                                          jd=index;
                                                          context
                                                              .read<DeletecartCubit>()
                                                              .deletecart(
                                                                id: cartdata?[index].id
                                                                    as int,
                                                              );



                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: height * 0.01, left: width * 0.03),
                                          width: width * 0.5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cartdata?[index].product?.name}',
                                                // softWrap: false,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Text(
                                                'EGP ${(cartdata?[index].product?.price)?.toDouble()}',
                                                // softWrap: false,
                                                //overflow:TextOverflow.fade ,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      'EGP ${(cartdata?[index].product?.oldPrice)?.toDouble()} ',
                                                  style: TextStyle(
                                                      decoration: TextDecoration.lineThrough,
                                                      decorationColor: Colors.grey[700],
                                                      //decorationStyle: TextDecorationStyle.solid,
                                                      decorationThickness: 2,
                                                      color: Colors.grey[700],
                                                      fontSize: 16),
                                                ),
                                                TextSpan(
                                                  text:
                                                      ' ${(cartdata?[index].product?.discount)}% OFF',
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w500),
                                                )
                                              ])),
                                              // SizedBox(height: height*0.02,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                },
              );
  },
);
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
      bottomNavigationBar:
             Container(
              height: height * 0.31,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.04),
                child: BlocBuilder<GetcartCubit, GetcartState>(


  builder: (context, state) {
    if (state is GetcartSucess) {
      var hh = context
          .read<GetcartCubit>()
          .showCartModel
          .data;
      total = hh!.total!;
      sub = hh.subTotal!;
    }
    return BlocBuilder<UpdatecartCubit, UpdatecartState>(

  builder: (context, state) {
    if(state is UpdatecartLoading){
      return Center(
          child: CircularProgressIndicator(
            color:
            Color.fromARGB(255, 74, 84, 176),
          ));
    }
     if(state is UpdatecartSucess){
      var or=context.read<UpdatecartCubit>().updateCartModel.data;
      total=or!.total!;
      sub=or.subTotal!;
      print('*************#${sub}');
    }
    return BlocBuilder<DeletecartCubit, DeletecartState>(
  builder: (context, state) {
    if(state is DeletecartSucces){
      var od=context.read<DeletecartCubit>().deleteCartModel.data;
      total=od!.total!;

      sub=od.subTotal!;
    }
    return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Subtotal',
                          style:
                              TextStyle(color: Color(0xff707B81), fontSize: 17),
                        ),
                        Spacer(),
                        Text(
                          'EGP ${(sub).toDouble()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery',
                          style:
                              TextStyle(color: Color(0xff707B81), fontSize: 17),
                        ),
                        Spacer(),
                        Text(
                         'EGP ${sub!=0 ?delivery:0}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Image.asset('assets/images/icons/Vector 1785.png'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Cost',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xff2B2B2B),
                              fontSize: 18),
                        ),
                        Spacer(),

                        Text(

                          'EGP ${(total.toDouble()) +( sub!=0 ?delivery:0)}',
                          style: TextStyle(
                            color: Color.fromARGB(255, 74, 84, 176),
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.9, height * 0.06),
                        backgroundColor: Color.fromARGB(255, 74, 84, 176),foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              13.0), // Adjust the border radius here
                        ),
                      ),
                    )
                  ],
                );
  },
);
  },
);
  },
),

            ),



      ),
    );
  }
}
