import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categoryitem.dart';
import 'package:meal_app/screens/mealdetail.dart';
import 'package:meal_app/screens/mealitem.dart';
import 'package:meal_app/screens/tabscreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favouriteMeal = [];
  void toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/CategoryItem": (context) => CategoryItem(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TabScreen(_favouriteMeal),
    );
  }
}
