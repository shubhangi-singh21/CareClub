import 'dart:ui';

import 'package:careclub/Auth/auth.dart';
import 'package:careclub/userLocation/location.dart';
//import 'package:careclub/userLocation/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
//import 'package:welfare/userLocation/location.dart';

//import '../Auth/auth.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Location()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName.png', width: 300.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);
    const pageDecoration = const PageDecoration(
      contentPadding: EdgeInsets.all(40),
      titleTextStyle: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),

      /// pageColor: Color(0xFFB3E5FC),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Quick donations at your fingertips!",
          body:
              "Donations accepted in the form of money, food, clothes and anything you'd like you donate to the needy.",
          image: _buildImage('page1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Easy pickup right from your doorstep!",
          body:
              "Wondering how to send your donations to the NGO? Don't worry, we'll take care of it.",
          image: _buildImage('page2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "We guarantee a secure and transparent platform to you",
          body:
              "Keep a track of your donations and the progress of your supported cause!",
          image: _buildImage('page3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:
              "We support and align with the UN's Sustainable Development Goals",
          body: "Select and support a global cause while making a donation!",
          image: _buildImage('page4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Small actions * Pool of helpful people = Big change",
          body:
              "Happiness doesn't result from what we get, but from what we give.\nTo care is to share.",
          image: _buildImage('page5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
