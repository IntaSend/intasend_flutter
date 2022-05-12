# intasend flutter

## How to install

    pub get intasend_flutter

## Getting Started

### Setup checkout screen

    import 'package:intasend_flutter/models/checkout.dart';
    import 'package:intasend_flutter/intasend_flutter.dart';

    // How to initiate the checkout widget
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

## Code example

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
        ));
    }