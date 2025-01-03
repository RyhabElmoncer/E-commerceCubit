import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../diohelper/urlapi.dart';
import '../login/login_screen.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        if (state is SignUploading) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height * 0.0),
                          Text(
                            'Register Account',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Fill your details or continue with social media',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: height * 0.1),
                          Row(
                            children: [
                              Text(
                                'Your Name ',
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
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Your Phone ',
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
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: 'Enter your Phone',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Email ',
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
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email address';
                                }
                                final emailPattern =
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                                final regExp = RegExp(emailPattern);
                                if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Password ',
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
                            height: height * 0.01,
                          ),
                          if (state is SignUpWrong)
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Api
                                Container(
                                  child: Text(
                                    ApiUrl.messageup,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFF0000),
                                    ),textAlign: TextAlign.start,
                                  ),
                                  width: width*0.9,
                                  padding: EdgeInsets.only(bottom: height*0.01),
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
                                  height: height * 0.04,
                                ),
                                //
                              ],
                            ),
                          ElevatedButton(
                            onPressed: () {
                              // Implement sign-Up functionality
                              context.read<SignUpCubit>().signup(
                                password: _passwordController.text,
                                email: _emailController.text,
                                name: _nameController.text,
                                phone: _phoneController.text,
                              );
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
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      // Handle the click action, e.g., navigate to the login page.
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Already Have Account?',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // decoration: TextDecoration.underline,
                          ),
                          children: [
                            TextSpan(
                              text: ' Login',
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
               child: Container
                 (
                  width: width,
                   color: Colors.transparent.withOpacity(0.2),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CircularProgressIndicator(color: Color.fromARGB(255, 74, 84, 176),),
                       SizedBox(height: height*0.04,),
                       const Text('Loading...',
                       style:TextStyle(
                         fontSize: 19,
                         color: Color.fromARGB(255, 74, 84, 176),
                          decoration: TextDecoration.none,
                       ),)
                     ],
                   )

               )
           ),
              //),
            ],

          );
        }
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.0),
                    Text(
                      'Register Account',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fill your details or continue with social media',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: height * 0.1),
                    Row(
                      children: [
                        Text(
                          'Your Name ',
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Your Phone ',
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
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Phone',
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Email ',
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          final emailPattern =
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                          final regExp = RegExp(emailPattern);
                          if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Password ',
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
                      height: height * 0.01,
                    ),
                    if (state is SignUpWrong)
                      Row(
                       // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Api
                          Container(
                            child: Text(
                              ApiUrl.messageup,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFF0000),
                              ),textAlign: TextAlign.start,
                            ),
                            width: width*0.9,
                            padding: EdgeInsets.only(bottom: height*0.01),
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
                            height: height * 0.04,
                          ),
                          //
                        ],
                      ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement sign-Up functionality
                        context.read<SignUpCubit>().signup(
                              password: _passwordController.text,
                              email: _emailController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                            );
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                // Handle the click action, e.g., navigate to the login page.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                    text: 'Already Have Account?',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                      // decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: ' Login',
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
