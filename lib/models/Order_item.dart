class Order_item {
  String _user;
  String _date;
  String _address;
  String _foods;
  double _price;

  String get date => _date;
  String get user => _user;
  String get foods => _foods;
  String get address => _address;
  double get price => _price;

  Order_item(this._user, this._date, this._address, this._foods, this._price);
}
