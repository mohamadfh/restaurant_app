import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_app/models/product_item.dart';

class FoodNotifier extends ChangeNotifier {
  List<product_item> _productList = [];

  UnmodifiableListView<product_item> get productList =>
      UnmodifiableListView(_productList);

  addFood(product_item food) {
    _productList.add(food);
    notifyListeners();
  }

  Remove_Food(index) {
    _productList
        .removeWhere((_food) => _food.title == _productList[index].title);
    notifyListeners();
  }
}
