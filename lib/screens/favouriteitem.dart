import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawr.dart';

import '../widgets/meal_item.dart';

class FavouriteItemScreen extends StatelessWidget {
  List<Meal> _favouriteMeal;
  FavouriteItemScreen(this._favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeal.isEmpty) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            title: Text("Favorites"),
          ),
          body: Center(
              child: Text(
            "You did not chose any favourite meals",
            style: TextStyle(fontSize: 20),
          )),
        ),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text("Favorites"),
          ),
          body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MealItemwidget(
                  id: _favouriteMeal[index].id,
                  title: _favouriteMeal[index].title,
                  imageUrl: _favouriteMeal[index].imageUrl,
                  complexity: _favouriteMeal[index].complexity,
                  affordability: _favouriteMeal[index].affordability,
                  duration: _favouriteMeal[index].duration,
                );
              },
              itemCount: _favouriteMeal.length,
            ),
        ),
      );
    }
  }
}
