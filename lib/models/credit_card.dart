class CreditCard {
  final String number;
  final String expiration;
  final int cvvs;
  final String cardType;

  CreditCard({this.number, this.expiration, this.cvvs, this.cardType});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
        number: json["number"],
        expiration: json["expiration"],
        cvvs: json["cvvs"],
        cardType: json["cardType"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['expiration'] = this.expiration;
    data['cvvs'] = this.cvvs;
    data['cardType'] = this.cardType;

    return data;
  }
}

// "number": "4436 0726 0369 4055",
// "expiration": "3/24",
// "cvvs": 754,
// "cardType": "Visa"
