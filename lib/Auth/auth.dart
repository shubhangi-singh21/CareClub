import 'package:careclub/Auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'signin.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 7),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: ExactAssetImage("images/logo.png"),
                      fit: BoxFit.contain)),
            ),
          ),
          Center(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              shadowColor: Colors.orange,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: HexColor("#931924"), width: 2)),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 70,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => One1()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: CupertinoColors.destructiveRed, fontSize: 19),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: HexColor("#931924"), width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text(
                  "COME JOIN US / SIGN UP",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                color: HexColor("#931924"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
