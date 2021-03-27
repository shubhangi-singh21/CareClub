import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Store1 extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.cart, color: Colors.black),
              onPressed: null)
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: "CARE",
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(2, 2))
                    ],
                    color: Colors.red[600],
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: "Club",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(2, 2))
                      ],
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " Store",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold)),
            ])),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/peace.jpeg",
                        alignment: Alignment.center,
                        height: 250,
                      ),
                      Text(
                        "Blue action T-shirt",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/Climate.jpeg",
                        alignment: Alignment.center,
                        height: 250,
                      ),
                      Text(
                        "Green action T-shirt",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/welfare.png",
                        alignment: Alignment.center,
                        height: 250,
                      ),
                      Text(
                        "CAREClub mug",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/umbrella.jpeg",
                        alignment: Alignment.center,
                        height: 240,
                      ),
                      Flexible(
                        child: Text(
                          "Sustainable goals\numbrella",
                          style: TextStyle(
                              color: CupertinoColors.black, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/sustainable.jpeg",
                        alignment: Alignment.center,
                        height: 230,
                      ),
                      Text(
                        "Sustainable goals bag",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/mask.jpeg",
                        alignment: Alignment.center,
                        height: 250,
                      ),
                      Text(
                        "Cotton Face mask",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
