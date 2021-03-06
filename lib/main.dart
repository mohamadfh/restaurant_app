import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/notifiers/CommentNotifier.dart';
import 'package:flutter_restaurant_app/notifiers/FoodNotifier.dart';
import 'package:flutter_restaurant_app/Screens/FirstHomePage.dart';
import 'package:flutter_restaurant_app/notifiers/OrdersNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FoodNotifier()),
        ChangeNotifierProvider(create: (context) => CommentNotifier()),
        ChangeNotifierProvider(create: (context) => OrdersNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starting page...',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FirstHomePage(),
    );
  }
}
