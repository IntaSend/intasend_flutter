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
Checkout checkout = new Checkout(publicKey:"ISPubKey_test_f453bc5b-bb5b-4585-9079-5008f9736449", amount:10.01, email:"joe@doe.com", currency:"USD",firstName:"f", lastName:"c");
    //checkout.publicKey = "YOUR-KEY";
    //checkout.amount =10.0;
    //checkout.email = "joe@doe.com";
    //checkout.firstName="Joe";
    //checkout.lastName="Doe";
print(checkout);
    IntasendFlutter.initCheckout(test:true, checkout:checkout, context:context);
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
                  onPressed: () {_runPayment(context);},
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
