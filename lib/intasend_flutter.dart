import 'package:flutter/material.dart';

import 'intasend_flutter_platform_interface.dart';
import 'package:intasend_flutter/models/checkout.dart';
import 'package:intasend_flutter/services/api.dart';
import 'package:intasend_flutter/pages/checkout_webview.dart';

class IntasendFlutter {
  Future<String?> getPlatformVersion() {
    return IntasendFlutterPlatform.instance.getPlatformVersion();
  }

  static initCheckout(
      {bool test: false,
      required Checkout checkout,
      required BuildContext context}) {
    IntaSendAPI.createCheckout(test: test, body: checkout.toJson())
        .then((value) async => {
              if (!value.url.isEmpty)
                {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IntasendWebView(url: value.url)))
                }
            });
  }
}
