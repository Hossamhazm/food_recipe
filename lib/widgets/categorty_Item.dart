import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Widget images;
  CategoryItems(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.images});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Opacity(opacity: 0.8, child: images),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: const TextStyle(
                  backgroundColor: Colors.black38,
                  color: Colors.white70,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed",
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          "/MealItem",
          arguments: {
            "id":id,
            "title":title
          },  
        );
      },
    );
  }
}
