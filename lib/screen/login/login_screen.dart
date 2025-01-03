import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../diohelper/urlapi.dart';
import '../profile/cubit/profile_cubit.dart';
import '../signup/signup.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return Stack(
            children: [
              Scaffold(
               // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 3),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01),
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Text(
                            'Hello Again!',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02),
                        Text(
                          'Fill Your Details Or Continue With',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          ' Social Media',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Row(
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.014),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        if (state is LoginWrong)
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Api
                              Container(
                                child: Text(
                                  ApiUrl.message,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFFF0000),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                width: width * 0.9,
                                padding: EdgeInsets.only(bottom: height * 0.01),
                              ),
                              //text wihtout Api
                              /*Text("Incorrect Email or Password, please try again",style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                    color: Color(0xFFFF0000),
                  ),
                    // textAlign: TextAlign.center,
                  ),*/
                              SizedBox(
                                height: height * 0.02,
                              ),
                              //
                            ],
                          ),
                        // SizedBox(height: height*0.04),
                        ElevatedButton(
                          onPressed: () {
                            context.read<LoginCubit>().login(
                                mail: _emailController.text,
                                password: _passwordController.text);

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 74, 84, 176),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: Size(double.infinity, 50.0),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // SizedBox(height: height*0.02),
                        /*ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shadowColor: Colors.blue,
                  elevation: 3,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Container(
                  height: height*0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        child: Image.asset("assets/images/icons/googleicon.png"),
                      ),
                      SizedBox(width: 16.0), // Add some spacing between the icon and text
                      Text(
                        'Sign In With Google',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )*/
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the signup page (main.dart)
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'New User? ',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // decoration: TextDecoration.underline,
                          ),
                          children: [
                            TextSpan(
                              text: 'Create Account',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Color.fromARGB(255, 74, 84, 176),
                                  fontWeight: FontWeight.w500
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Center(
                  child: Container(
                      width: width,
                      color: Colors.transparent.withOpacity(0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Color.fromARGB(255, 74, 84, 176),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Loading...',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 74, 84, 176),
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ))),
            ],
          );
        }
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text(
                      'Hello Again!',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02),
                  Text(
                    'Fill Your Details Or Continue With',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' Social Media',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Row(
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.014),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  if (state is LoginWrong)
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Api
                        Container(
                          child: Text(
                            ApiUrl.message,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFF0000),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          width: width * 0.9,
                          padding: EdgeInsets.only(bottom: height * 0.01),
                        ),
                        //text wihtout Api
                        /*Text("Incorrect Email or Password, please try again",style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                    color: Color(0xFFFF0000),
                  ),
                    // textAlign: TextAlign.center,
                  ),*/
                        SizedBox(
                          height: height * 0.02,
                        ),
                        //
                      ],
                    ),
                  // SizedBox(height: height*0.04),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().login(
                          mail: _emailController.text,
                          password: _passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 74, 84, 176),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(height: height*0.02),
                  /*ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shadowColor: Colors.blue,
                  elevation: 3,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Container(
                  height: height*0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        child: Image.asset("assets/images/icons/googleicon.png"),
                      ),
                      SizedBox(width: 16.0), // Add some spacing between the icon and text
                      Text(
                        'Sign In With Google',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )*/
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                // Navigate to the signup page (main.dart)
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                    text: 'New User? ',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                        fontWeight: FontWeight.w500
                      // decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color.fromARGB(255, 74, 84, 176),
                            fontWeight: FontWeight.w500
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
