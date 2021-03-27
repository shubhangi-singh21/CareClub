import 'package:careclub/Global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Image.network(imageUrl),
              ),
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text(
                email,
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 270.0,
                child: Divider(
                  color: CupertinoColors.activeOrange,
                  thickness: 0.3,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.security,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Privacy',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Transaction History',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Help & Support',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Invite a Friend',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 60.0,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: HexColor("#931924"),
                  child: ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
