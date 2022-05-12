import 'package:flutter/material.dart';
import 'package:intasend_flutter/models/checkout.dart';
import 'package:intasend_flutter/intasend_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
