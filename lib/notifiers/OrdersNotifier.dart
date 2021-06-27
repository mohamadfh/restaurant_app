import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_app/models/Constants.dart';
import 'package:flutter_restaurant_app/models/Order_item.dart';
import 'package:flutter_restaurant_app/models/RestaurantOwner.dart';

class OrdersNotifier extends ChangeNotifier {
  List<Order_item> orderList;
  Constants constants;

  void getList(RestaurantOwner restaurantOwner) async {
    String orders;
    await Socket.connect(constants.ip, constants.port).then((serverSocket) {
      print('connected');
      serverSocket.writeln(restaurantOwner.phoneNumber + "|RestaurantOrders");
      serverSocket.flush();
      serverSocket.listen((socket) {
        orders = String.fromCharCodes(socket).trim();
        List<String> eachOrder = orders.split("|");
        for (String order in eachOrder) {
          List<String> fields = order.split(",");
          Order_item orderItem = new Order_item(fields[0], fields[1], fields[2],
              fields[3], double.parse(fields[4]));
          orderList.add(orderItem);
        }
      });
      serverSocket.close();
    });
    notifyListeners();
  }
}
