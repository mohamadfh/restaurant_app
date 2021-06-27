class RestaurantOwner {
  String _phoneNumber;
  String _password;

  String get phoneNumber => _phoneNumber;
  String get password => _password;

  setPhonePass(String phone, String pass) {
    _phoneNumber = phone;
    _password = pass;
  }
}
