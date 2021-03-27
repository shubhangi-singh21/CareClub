import 'package:careclub/Payment/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Payment',
            style: TextStyle(color: HexColor("#931924"), fontSize: 25),
          )),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Card(
              elevation: 20,
              child: Container(
                height: 190,
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "Are you sure you want to continue with the payment?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                        ),
                        RaisedButton(
                            color: HexColor("#931924"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                            onPressed: openCheckout,
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                            onPressed: () {},
                            child: Text(
                              'No',
                              style: TextStyle(color: HexColor("#931924")),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_wAXhdAl48q055k',
      'amount': 10000,
      'name': 'UTHAAN NGO',
      //'description': 'Fine T-Shirt',
      'prefill': {'contact': '7007499578', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _showDialog(int task, {String id}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return task == 1
            ? DialogResponses(
                color: Colors.green[300],
                icon: Icons.check_circle,
                message: "Transaction\nSuccessfull",
                id: id,
              )
            : task == 2
                ? DialogResponses(
                    color: Colors.red,
                    icon: Icons.cancel,
                    message: "Transaction\nFailed",
                  )
                : DialogResponses(
                    color: Colors.amber,
                    icon: Icons.account_balance_wallet,
                    message: "Selected\nExternal Wallet",
                  );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _showDialog(1, id: response.paymentId);
    //Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName);
  }
}
