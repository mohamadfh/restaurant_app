class product_item {
  /*static const ID = "id";
  static const Title = "title";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";*/

  String _title;
  String _id;
  String _imageUrl;
  String _description;
  String _category;
  double _price;

  String get id => _id;
  String get title => _title;
  String get image => _imageUrl;
  String get description => _description;
  String get category => _category;
  double get price => _price;

  void Set_id(String id) {
    _id = id;
  }

  void Set_title(String title) {
    _title = title;
  }

  void Set_image(String image_url) {
    _imageUrl = image_url;
  }

  void Set_description(String description) {
    _description = description;
  }

  void Set_category(String category) {
    _category = category;
  }

  void Set_price(double price) {
    _price = price;
  }
}
