import 'package:careclub/Donate/donate.dart';
import 'package:careclub/Explore/explore.dart';
import 'package:careclub/Profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:careclub/Summary/summary.dart';
import 'package:careclub/Store/store.dart';

Widget widget;
int selected;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selected = 0;
      screen(selected);
    });
  }

  void screen(int i) {
    switch (i) {
      case 0:
        widget = Explore();
        break;
      case 1:
        widget = Store1();
        break;
      case 2:
        widget = Donate();
        break;
      case 3:
        widget = Summary1();
        break;
      case 4:
        widget = Profile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 23,
          currentIndex: selected,
          onTap: (int index) {
            setState(() {
              selected = index;
              screen(index);
            });
          },
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: HexColor("#aaaaaa"),
          showUnselectedLabels: false,
          selectedItemColor: HexColor("#931924"),
          elevation: 20,
          backgroundColor: Colors.white54,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: 25,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(FontAwesome.shopping_cart),
                title: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Store",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.handHoldingHeart),
                title: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Donate",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.ios_document),
                title: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ))
          ]),
    );
  }
}
