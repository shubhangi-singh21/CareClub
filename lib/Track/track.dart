import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

int c;

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  List<String> name4 = ["Call", "Chat"];

  List<Icon> icon = [
    Icon(
      Icons.person,
      color: HexColor("#931924"),
    ),
    Icon(
      FontAwesome.map_marker,
      color: HexColor("#931924"),
    ),
    Icon(
      CupertinoIcons.map_pin,
      color: HexColor("#931924"),
    ),
    Icon(
      FontAwesome.road,
      color: HexColor("#931924"),
    ),
    Icon(
      FontAwesome.check,
      color: HexColor("#931924"),
    ),
    Icon(
      CupertinoIcons.smiley,
      color: HexColor("#931924"),
    ),
  ];

  List<String> names3 = [
    "Donation request confirmed",
    "Donation pick-up successful ",
    "Donation reached NGO ",
    "On the way to destination! ",
    "Donation reached destination!",
    "Voila! You brought a SMILE on someone's FACE today",
  ];
  TextEditingController _numberCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "085921191121";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(FontAwesome.address_book),
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  child: ListView.builder(
                                      itemCount: 2,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              focusColor: Colors.blue,
                                              hoverColor: Colors.blue,
                                              onTap: () {
                                                c = index;
                                              },
                                              title: Row(
                                                children: [
                                                  Icon(
                                                    index == 0
                                                        ? CupertinoIcons.phone
                                                        : CupertinoIcons
                                                            .chat_bubble,
                                                    color: CupertinoColors
                                                        .activeOrange,
                                                  ),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Center(
                                                      child:
                                                          Text(name4[index])),
                                                ],
                                              ),
                                            ),
                                            Divider()
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(height: 12),
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: RaisedButton(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text(
                                          "Next",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (c == 0) {
                                          FlutterPhoneDirectCaller.callNumber(
                                              _numberCtrl.text);
                                        }
                                      }),
                                )
                              ]));
                    });
              })
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Progress",
          style: TextStyle(color: HexColor("#931924"), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: ListView.builder(
                  itemCount: icon.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: icon[index],
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]),
                                    borderRadius: BorderRadius.circular(200)),
                              ),
                              Container(
                                  width: 4,
                                  height: 22,
                                  color: index == 0
                                      ? Colors.green[700]
                                      : Colors.grey[400])
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(15)),
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.height / 12,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                names3[index],
                                style: TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor("#931924"), width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 13.3,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "View Pictures/videos of your donation",
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),

      /* SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child:
                        Icon(Icons.person, color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Donation request confirmed",
                        style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(FontAwesome.map_marker,
                        color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Donation pick-up successful ",
                        style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(CupertinoIcons.map_pin,
                        color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        "Donation reached NGO ",
                        style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(FontAwesome.road,
                        color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        "On the way to destination! ",
                        style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(FontAwesome.check,
                        color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Donation reached destination!",
                        style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(CupertinoIcons.map_pin,
                        color:  Colors.orange),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 50.0,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                        text: TextSpan(
                            text: "Voila! You brought a ",
                            children: <TextSpan>[
                              TextSpan(
                                  text: "SMILE",
                                  style: TextStyle(
                                      color:  Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " on someone's",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " FACE",
                                  style: TextStyle(
                                      color:  Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " today.",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor("#FF6666"), width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 13.3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "View Pictures/videos of your donation",
                          style: TextStyle(
                              color:  Colors.orange,
                              fontSize: 20),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),*/
    );
  }
}
