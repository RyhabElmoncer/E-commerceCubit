import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../const.dart';
import '../diohelper/urlapi.dart';
import 'cubit/profile_cubit.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 19, color: Colors.black),
          ),
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {});
                },
                child: CircleAvatar(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Color(0xff303030),
                  ),
                  backgroundColor: Color(0xffF7F7F9),
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 74, 84, 176),
                ));
              }
              final p = context.read<ProfileCubit>().profileModel.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Center(
                    child: CachedNetworkImage(

                      imageUrl: picture1,
                      width: width * 0.4,
                      height: height*0.2,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 74, 84, 176),
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  profiltxt(name: 'Your Name'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    enabled: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: p?.name,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjust the vertical padding here
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  profiltxt(name: 'Email Address'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    enabled: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: p?.email,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjust the vertical padding here
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  profiltxt(name: 'Phone'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    enabled: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: p?.phone,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjust the vertical padding here
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }

  Widget profiltxt({required String name}) {
    return Text(
      name,
      style: TextStyle(
        color: Color(0xff2B2B2B),
        fontSize: 19,
      ),
    );
  }
}
