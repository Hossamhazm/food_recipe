import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categoryitem.dart';
import 'package:meal_app/screens/favouriteitem.dart';
import 'package:meal_app/widgets/main_drawr.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabScreen(this.favouriteMeal, {Key key}) : super(key: key);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages ;
  @override
  void initState() {
    _pages=[
    {
      "page": CategoryItem(),
      "title": "Categories",
    },
    {
      "page": FavouriteItemScreen(widget.favouriteMeal),
      "title": "Favorites",
    }
  ];
    super.initState();
  }
  int _selectedIndex = 0;
  _selecPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex]["page"],
        bottomNavigationBar: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _selecPage,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            rippleColor: Colors.grey[800],
            hoverColor: Colors.grey[700],
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 200),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.pinkAccent,
            iconSize: 24,
            tabBackgroundColor: Colors.pinkAccent.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: const [
              GButton(
                icon: Icons.category,
                text: 'Category',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
            ]),
      ),
    );
  }
}
