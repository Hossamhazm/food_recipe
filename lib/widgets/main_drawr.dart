import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/contact.dart';

import '../screens/CategoryItem.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
  
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontSize: 40),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: const Text(
              'Meals',
              style: TextStyle(fontSize: 30),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) {
                return CategoryItem();
              })));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text(
              'Contact With US!',
              style: TextStyle(fontSize: 30),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) {
                return ContactScreen();
              })));
            },
          ),
        ],
      ),
    );
  }
}
