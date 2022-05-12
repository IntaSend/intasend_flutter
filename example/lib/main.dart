import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:intasend_flutter/intasend_flutter.dart';
import 'package:intasend_flutter/models/checkout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _intasendFlutterPlugin = IntasendFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _intasendFlutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    _runPayment(context) {
      // Initialize checkout
      Checkout checkout = Checkout(
          publicKey: "<PUBLIC-KEY>",
          amount: 10.01,
          email: "joe@doe.com",
          currency: "USD",
          firstName: "Joe",
          lastName: "Doe");

      // Add test to true in sandbox environment. Use false to go live
      IntasendFlutter.initCheckout(
          test: true, checkout: checkout, context: context);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(3.0),
                color: Color(0xff3182CE),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                  onPressed: () {
                    // Call run payment on button press
                    _runPayment(context);
                  },
                  child: Text(
                    "Complete Payment",
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
