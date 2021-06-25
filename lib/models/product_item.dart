import 'package:flutter/cupertino.dart';

class product_item extends ChangeNotifier {
  /*static const ID = "id";
  static const Title = "title";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";*/

  //String _id;
  String _title;
  String _imageUrl;
  String _description;
  String _category;
  double _price;

  //String get id => _id;
  String get title => _title;
  String get image => _imageUrl;
  String get description => _description;
  String get category => _category;
  double get price => _price;

  product_item(this._title, this._description, this._imageUrl, this._category,
      this._price);

  /*void Set_title(String title) {
    _title = title;
    notifyListeners();
  }

  void Set_image(String image_url) {
    _imageUrl = image_url;
    notifyListeners();
  }

  void Set_description(String description) {
    _description = description;
    notifyListeners();
  }

  void Set_category(String category) {
    _category = category;
    notifyListeners();
  }

  void Set_price(double price) {
    _price = price;
    notifyListeners();
  }*/
}
