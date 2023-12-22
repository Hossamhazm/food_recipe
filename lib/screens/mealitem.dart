import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/mealdetail.dart';
import 'package:meal_app/widgets/main_drawr.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealItem extends StatefulWidget {
  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routeArg["title"];
    final displayedMeal = DUMMY_MEALS.where((element) {
      return element.categories.contains(routeArg["id"]);
    }).toList();

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

    bool _isMealFavourite(String id) {
      return _favouriteMeal.any((element) => element.id==id);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/MealDetailscreen": (context) => MealDetailscreen(toggleFavourite,_isMealFavourite)
      },
      home: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(
            categorytitle,
            style: const TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return MealItemwidget(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
              duration: displayedMeal[index].duration,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}
