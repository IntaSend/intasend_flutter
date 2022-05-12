class Checkout {
  String? id;
  String publicKey = "";
  String currency = "KES";
  double amount = 0.01;
  String? url;
  String? email;
  String? firstName;
  String? lastName;
  String? createdAt;

  Checkout(
      {required String publicKey,
      String? id,
      String? createdAt,
      String? email,
      String? lastName,
      String? firstName,
      String? url,
      required String currency,
      required double amount}) {
    this.id = id!;
    this.publicKey = publicKey;
    this.amount = amount;
    this.currency = currency;
    this.firstName = firstName!;
    this.lastName = lastName!;
    this.url = url!;
    this.email = email!;
    this.createdAt = createdAt!;
  }

  Checkout.fromJson(Map json)
      : id = json['id'],
        url = json['url'],
        amount = json['amount'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        createdAt = json['created_at'];

  Map toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'amount': amount,
      'currency': currency,
      'public_key': publicKey
    };
  }
}
