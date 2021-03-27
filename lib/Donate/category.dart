import 'package:careclub/Cloth/clothes.dart';
import 'package:careclub/Food/food.dart';
import 'package:careclub/Payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:welfare/Cloth/clothes.dart';
//import 'package:welfare/Food/food.dart';
//import 'package:welfare/Payment/payment.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Donate",
          style: TextStyle(color: HexColor("#931924")),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              "Select Category",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Colors.black38,
                        offset: Offset(2, 2))
                  ],
                  color: HexColor("#931924"),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Text(
              "What would you like to donate today",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Colors.white,
                        offset: Offset(2, 2))
                  ],
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Clothes()));
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          width: 220,
                          height: 400,
                          child: Image.asset(
                            "images/clothes.png",
                            fit: BoxFit.cover,
                            scale: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonatePage()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 4,
                        child: Container(
                          width: 240,
                          height: 340,
                          child: Image.asset(
                            "images/food.png",
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 4,
                        child: Container(
                          width: 240,
                          height: 340,
                          child: Image.asset(
                            "images/money.png",
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 4,
                        child: Container(
                          width: 240,
                          height: 340,
                          child: Image.asset(
                            "images/others.png",
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 2),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
