# intasend flutter

Plugin for IntaSend's checkout integration.

## How to setup checkout screen

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

Check [example code here.](https://pub.dev/packages/intasend_flutter/example)
