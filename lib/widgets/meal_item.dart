// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';

class MealItemwidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItemwidget({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String amountofcomplexity() {
      if (complexity == Complexity.Simple) {
        return "Simple";
      } else if (complexity == Complexity.Hard) {
        return "Hard";
      } else if (complexity == Complexity.Challenging) {
        return "Challenging";
      }
    }

    String amountofaffordability() {
      if (affordability == Affordability.Pricey) {
        return "Pricey";
      } else if (affordability == Affordability.Luxurious) {
        return "Luxurious";
      } else if (affordability == Affordability.Affordable) {
        return "Affordable";
      }
    }

    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(imageUrl)),
              Positioned(
                bottom: 20,
                right: 10,
                child: SizedBox(
                  width: 220,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      backgroundColor: Colors.black26,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_alarm,
                      size: 40,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text("$duration min")
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.work,
                    size: 40,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(amountofcomplexity())
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.attach_money,
                    size: 40,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(amountofaffordability())
                ],
              ),
            ]),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          "/MealDetailscreen",
          arguments: id,
        );
      },
    );
  }
}
