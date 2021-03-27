import 'package:careclub/Auth/google.dart';
import 'package:careclub/Home/home.dart';
import 'package:careclub/Language/language1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hexcolor/hexcolor.dart';

AuthResult authResult;
String user;
String c;
bool check = false;

class One1 extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _One1State state = context.findAncestorStateOfType<_One1State>();
    state.setLocale(locale);
  }

  @override
  _One1State createState() => _One1State();
}

class _One1State extends State<One1> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('hi', 'IN'), // Hebrew, no country code
        // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      locale: _locale,
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (devicelocale, supportedlocale) {
        for (var locale in supportedlocale) {
          if (locale.languageCode == devicelocale.languageCode &&
              locale.countryCode == devicelocale.countryCode) {
            return devicelocale;
          }
        }
        return supportedlocale.first;
      },
      home: Signin(),
    );
  }
}

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  void _changelanguage(String change1) {
    Locale _temp;
    switch (change1) {
      case 'en':
        _temp = Locale(change1, 'US');
        break;
      case 'hi':
        _temp = Locale(change1, 'IN');
        break;
    }

    One1.setLocale(context, _temp);
  }

  List<String> a1 = ["English", "हिंदी", "தமிழ்", "বাংলা", "ਪੰਜਾਬੀ"];
  List<String> b = ["en", "hi"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  var email = "";
  var passwd = "";

  Future<AuthResult> signIn(String email, String password) async {
    try {
      AuthResult user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      assert(user != null);
      assert(await user.user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.language_outlined,
                  size: 29,
                  color: Colors.black,
                ),
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
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Please Select Your Language",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Text("कृपया अपनी भाषा चुनें",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    child: ListView.builder(
                                        itemCount: a1.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                focusColor: Colors.blue,
                                                hoverColor: Colors.blue,
                                                onTap: () {
                                                  c = b[index];
                                                },
                                                title: Center(
                                                    child: Text(a1[index])),
                                              ),
                                              Divider()
                                            ],
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                  ),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () {
                                          _changelanguage(c);

                                          Navigator.pop(context);
                                        }),
                                  )
                                ]));
                      });
                }),
          ),
        ],
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
            ),
            Center(
              child: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/logo.png"),
                        fit: BoxFit.contain)),
              ),
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 370,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty || !value.contains("@")) {
                                return "Please enter valid email-id";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: CupertinoColors.systemGrey),
                                hintText: DemoLocalization.of(context)
                                    .gettranslatedvalue('E-mail'),
                                prefixIcon: Icon(Icons.person,
                                    color: HexColor("#931924")),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 370,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Password must be 7 characters long";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            onSaved: (value) {
                              passwd = value;
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.visibility_off_outlined,
                                color: HexColor("#931924"),
                              ),
                              hintStyle:
                                  TextStyle(color: CupertinoColors.systemGrey),
                              hintText: DemoLocalization.of(context)
                                  .gettranslatedvalue('pwd'),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: HexColor("#931924"),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DemoLocalization.of(context).gettranslatedvalue('pwd1'),
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
                child: Container(
              width: 210,
              height: 70,
              child: FlatButton(
                  color: HexColor("#931924"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () async {
                    if (formkey.currentState.validate()) {
                      formkey.currentState.save();
                      signIn(email, passwd).then((user) {
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Test()));
                        } else {
                          print("not");
                        }
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      DemoLocalization.of(context).gettranslatedvalue('Login'),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: 160.0,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "or",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: 160.0,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: HexColor("#931924")),
                  borderRadius: BorderRadius.circular(15)),
              width: 350,
              height: 70,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () async {
                    signInWithGoogle().whenComplete(() async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Test();
                          },
                        ),
                      );
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: ExactAssetImage("images/google.jpg"),
                        radius: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          DemoLocalization.of(context)
                              .gettranslatedvalue('google'),
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
