class STKPush {
  int amount;
  String phoneNumber;
  String narrative;

  STKPush(
      {required this.amount,
      required this.phoneNumber,
      required this.narrative});

  STKPush.fromJson(Map json)
      : amount = json['amount'],
        phoneNumber = json['phone_number'],
        narrative = json['narrative'];

  Map toJson() {
    return {
      'amount': amount,
      'phone_number': phoneNumber,
      'narrative': narrative
    };
  }
}
