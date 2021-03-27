import 'dart:io';

import 'package:careclub/Global/global.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

bool check = true;

class Clothes extends StatefulWidget {
  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _email = "";
  var _name = "";
  var _number = " ";
  var _passwd = "";
  var _passwd1 = "";
  var _address = "";
  var _state = "";
  var _city = "";
  TextEditingController _phone = new TextEditingController();
  TextEditingController _clothes = new TextEditingController();

  final picker = ImagePicker();
  File image1;
  final databaseReference = FirebaseDatabase.instance.reference();
  var uid = Uuid();
  Future uploadToStorage() async {
    try {
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = (millSeconds.toString() + uid.toString());
      final String today = ('$month-$date');

      final file = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      image1 = File(file.path);
      uploadVideo(image1).then((value) => {add()});
    } catch (error) {
      print(error);
    }
  }

  Future<String> uploadVideo(var videofile) async {
    var uuid = new Uuid().v1();
    StorageReference ref =
        FirebaseStorage.instance.ref().child("post_$uuid.jpg");

    await ref.putFile(videofile).onComplete.then((val) {
      val.ref.getDownloadURL().then((val) {
        print(val);
        downloaurl = val;

        setState(() {
          check = !check;
        });
      });
    });
    return downloaurl;
  }

  Future<void> add() async {
    var uuid = new Uuid().v1();
    DatabaseReference _color2 =
        databaseReference.child("Clothes").child(user1).child(uuid);
    final TransactionResult transactionResult =
        await _color2.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _color2.push().set(<String, String>{
        "Name": "true",
        "address": "true",
        "clothes": "true",
        "uid": "true"
      }).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
    _color2.set({
      "name": name,
      "address": address1,
      "clothes": downloaurl,
      "uid": uuid
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "images/clothes.png",
                height: 220,
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 230),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 11.3,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: HexColor("#931924"),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(fontSize: 19),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 11.3,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  color: HexColor("#931924"),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Flexible(
                                    child: Text(
                                  address1,
                                  style: TextStyle(fontSize: 19),
                                ))
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 11.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _phone,
                            validator: (value) {
                              if (value.isEmpty || value.length < 10) {
                                return "Please enter valid mobile number";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _number = value;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  CupertinoIcons.phone,
                                  color: HexColor("#931924"),
                                ),
                                border: InputBorder.none,
                                hintText: "Enter mobile number",
                                hintStyle: TextStyle(
                                    color: Colors.black38, fontSize: 19)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 11.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _clothes,
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Password must be 7 characters long";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              _passwd = value;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  MaterialCommunityIcons.card_bulleted_outline,
                                  color: HexColor("#931924"),
                                ),
                                border: InputBorder.none,
                                hintText: "Cloth Description",
                                hintStyle: TextStyle(
                                    color: Colors.black38, fontSize: 19)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 11.3,
                          child: Row(
                            children: [
                              SizedBox(width: 14),
                              Icon(
                                FontAwesome.image,
                                color: HexColor("#931924"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                check == true
                                    ? "Attach an image"
                                    : "Image uploaded",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.black54),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              IconButton(
                                color: HexColor("#931924"),
                                onPressed: () async {
                                  uploadToStorage();
                                },
                                icon: Icon(
                                  FontAwesome.upload,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _phone.clear();
                      _clothes.clear();
                      setState(() {
                        check = !check;
                      });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                RaisedButton(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text("Done"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })
                              ],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              content: Text(
                                  "Request submitted successfully. A pickup person from NGO will soon contact you .The clothes will be verified and collected from your doorstep"),
                            );
                          });
                    },
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor("#931924"), width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 11.3,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: HexColor("#931924"), fontSize: 25),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
