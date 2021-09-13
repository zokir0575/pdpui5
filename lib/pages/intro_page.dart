import 'package:flutter/material.dart';
import 'package:pdpui5/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;
  bool _isVisible = false;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(left: 20, bottom: 50, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Visibility(
                  visible: _isVisible,
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
            ),
          ),
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              makePage(
                title: "Learn from Experts",
                content: "Select from top instructors around the world ",
                image: "assets/images/ic_image9.jpg",
              ),
              makePage(
                title: "Learn from Experts",
                content: "Select from top instructors around the world ",
                image: "assets/images/ic_image9.jpg",
              ),
              makePage(
                title: "Learn from Experts",
                content: "Select from top instructors around the world ",
                image: "assets/images/ic_image9.jpg",

              ),
          ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildindicator(),
            ),
          ),
    ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildindicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      //wu int i lani cumadm nma ula?
      textVisibility();
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  void textVisibility() {
    setState(() {
      if (currentIndex == 1) {
        _isVisible = true;
      } else {
        _isVisible = false;
      }
    });
  } //skippi tegiga qoybern anuni oldiga

}
