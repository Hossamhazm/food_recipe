import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/mealitem.dart';
import 'package:meal_app/screens/tabscreens.dart';
import 'package:meal_app/widgets/main_drawr.dart';

import '../widgets/categorty_Item.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({Key key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/MealItem": (context) => MealItem()},
      home: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "Meal App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "images/coverapp.jpg",
                fit: BoxFit.cover,
              ),
            ),
            GridView(
              padding: EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: DUMMY_CATEGORIES
                  .map((e) => CategoryItems(
                        id: e.id,
                        title: e.title,
                        images: e.images,
                      ))
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }
}
