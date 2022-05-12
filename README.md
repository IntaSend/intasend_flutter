# intasend_flutter

**Do not use, still in development**

## Getting Started

### Setup checkout screen

    import 'package:intasend_flutter/models/checkout.dart';
    import 'package:intasend_flutter/intasend_flutter.dart';


    Checkout checkout = Checkout;
    checkout.publicKey = "YOUR-KEY";
    checkout.amount =10.0;
    checkout.email = "joe@doe.com";
    checkout.firstName="Joe";
    checkout.lastName="Doe";

    IntasendFlutter.initCheckout(test=true, checkout=checkout, context=context)
