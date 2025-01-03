import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late Color _color;
  int page = -1;
  int i = 0;
  double? size1;
  double? size2;
  PageController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> contents = [
      Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset('assets/images/onbording/Highlight1.png'),
                  width: width * 0.08,
                  margin:
                      EdgeInsets.only(top: height * 0.311, left: width * 0.08),
                ),
                Center(
                  child: Container(
                    child: Image.asset('assets/images/onbording/page1name.png'),
                    width: width * 0.3,
                    margin: EdgeInsets.only(top: height * 0.48, left: 0),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  margin:
                      EdgeInsets.only(top: height * 0.34, left: width * 0.11),
                  child: Center(
                    child: Text(
                      'WELLCOME TO SHOPPING ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.99,
                  margin:
                      EdgeInsets.only(top: height * 0.56, left: width * 0.04),
                  child: Center(
                    child: Text(
                      'A social App to Facilitate online commerce ',
                      style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Raleway',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                      'assets/images/onbording/hightlight1page3.png'),
                  width: width * 0.15,
                  margin:
                      EdgeInsets.only(top: height * 0.10, left: width * 0.70),
                ),
                Container(
                  child: Image.asset('assets/images/onbording/Ellipse1.png'),
                  width: width * 0.5,
                  margin:
                      EdgeInsets.only(top: height * 0.62, left: width * 0.15),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset(
                      'assets/images/onbording/hightlight1page2.png'),
                  width: width * 0.15,
                  margin:
                      EdgeInsets.only(top: height * 0.1, left: width * 0.78),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/onbording/hightlight2page2.png',
                    height: height * 0.12,
                    fit: BoxFit.cover,
                  ),
                  padding: EdgeInsets.only(top: height * 0.07),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/onbording/1.png',
                  ),
                  width: width * 0.80,
                  height: height * 0.5,
                  margin:
                      EdgeInsets.only(top: height * 0.11, left: width * 0.10),
                ),
                Container(
                  child: Image.asset('assets/images/onbording/Ellipse2.png'),
                  width: width * 0.62,
                  margin:
                      EdgeInsets.only(top: height * 0.45, left: width * 0.12),
                ),
                Center(
                    child: Container(
                  width: width * 0.92,
                  margin: EdgeInsets.only(top: height * 0.57, left: 0),
                  child: Text(
                    'Let\'s Start Journey',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                )),
                /*   Container(
                  child: Image.asset('assets/images/onbording/watermark.png'),
                  width: width,
                  margin: EdgeInsets.only(top: height*0.53,left: 0),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Container(
                    child: Text(
                      'Smart, Gorgeous & Fashionable Collection Explore Now',
                      style: TextStyle(fontSize: 19, color: Color(0xFFD8D8D8)),
                      textAlign: TextAlign.center,
                    ),
                    width: width,
                    margin: EdgeInsets.only(top: height * 0.62, left: 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset(
                      'assets/images/onbording/hightlight1page3.png'),
                  width: width * 0.22,
                  margin:
                      EdgeInsets.only(top: height * 0.08, left: width * 0.10),
                ),
                Container(
                  child: Image.asset('assets/images/onbording/6.png'),
                  width: width*0.99,
                  margin:
                      EdgeInsets.only(top: height * 0.14, left: width * 0.05),
                ),
                Center(
                  child: Container(
                    width: width * 0.75,
                    margin: EdgeInsets.only(top: height * 0.55, left: 0),
                    child: Text(
                      'You Have The Power To',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                /*Container(
                  child: Image.asset('assets/images/onbording/watermark.png'),
                  width: width,
                  margin: EdgeInsets.only(top: height*0.53,left: 0),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Text(
                      'There Are Many Beautiful And Attractive Plants To Your Room',
                      style: TextStyle(fontSize: 19, color: Color(0xFFD8D8D8)),
                      textAlign: TextAlign.center,
                    ),
                    width: width,
                    margin: EdgeInsets.only(top: height * 0.68, left: 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 84, 176),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: height * 0.53,
                ),
                Image.asset('assets/images/onbording/watermark.png'),
              ],
            )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.89),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 74, 84, 176), backgroundColor: Colors.white,
                      shadowColor: Colors.blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize:
                          Size(width * 0.87, height * 0.06), //////// HERE
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentIndex + 1 == contents.length) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(),
                            ),
                          );
                        }
                        _controller?.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      });
                    },
                    child: Center(
                      child: Text(
                        currentIndex != contents.length - 1
                            ? 'Next'
                            : 'Get Started',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ]),
            Container(
              height: height * 0.9,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    // index=indexx;
                    //indexx++;
                    // index=indexx;
                    return contents[index];
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.80, left: width * 0.4),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    contents.length,
                    (index) => buildborder(index, context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildborder(int index, BuildContext context) {
    currentIndex == index ? _color = Colors.white : _color = Colors.amber;

    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        height: 5,
        width: currentIndex == index ? 30 : 20,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _color,
        ),
      ),
    );
  }
}
