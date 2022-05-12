import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intasend_flutter/models/checkout.dart';
import 'package:intasend_flutter/models/stkpush.dart';

class IntaSendAPI {
  static Future createCheckout({bool test = false, body}) async {
    String baseUrl = "https://payment.intasend.com";
    if (test) {
      baseUrl = "https://sandbox.intasend.com";
    }
    var url = "$baseUrl/api/v1/checkout/";
    var headers = {"Content-Type": "application/json"};
    final resp = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      Checkout checkout = Checkout.fromJson(json.decode(resp.body));
      return checkout;
    } else {
      throw Exception(resp.body);
    }
  }

  static Future sendSTKPushRequest({bool test = false, body}) async {
    String baseUrl = "https://payment.intasend.com";
    if (test) {
      baseUrl = "https://sandbox.intasend.com";
    }
    var url = "$baseUrl/api/v1/send-mpesa-stk-push/";
    var headers = {"Content-Type": "application/json"};
    final resp = await http.post(Uri.parse(url), headers: headers, body: body);
    if (resp.statusCode == 200) {
      return STKPush.fromJson(json.decode(resp.body));
    } else {
      throw Exception(resp.body);
    }
  }
}
