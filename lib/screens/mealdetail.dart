import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/main_drawr.dart';

class MealDetailscreen extends StatelessWidget {
  Function toggleFavourite;
  Function isMealFavourite;
  MealDetailscreen(this.toggleFavourite,this.isMealFavourite);
  @override
  Widget build(BuildContext context) {
    final String mealsid = ModalRoute.of(context).settings.arguments as String;

    final selectedMealdetails = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealsid;
    });
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:()=> toggleFavourite(mealsid),
          child: Icon(
             isMealFavourite(mealsid )?Icons.star:Icons.star_border),
          backgroundColor: Colors.pinkAccent,
        ),
        appBar: AppBar(
          title: Text(selectedMealdetails.title),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  selectedMealdetails.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: const Text(
                  "Ingredients :",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    fontFamily: "Raleway",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black87),
                ),
                margin: EdgeInsets.all(10),
                height: 200,
                width: 450,
                child: ListView.builder(
                  itemBuilder: ((ctx, index) => Card(
                        margin: EdgeInsets.all(5),
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${index + 1}- ",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                selectedMealdetails.ingredients[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  itemCount: selectedMealdetails.ingredients.length,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: const Text(
                  "Steps :",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    fontFamily: "Raleway",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black87),
                ),
                margin: EdgeInsets.all(10),
                height: 200,
                width: 450,
                child: ListView.builder(
                  itemCount: selectedMealdetails.steps.length,
                  itemBuilder: ((ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                "${index + 1}#",
                              ),
                            ),
                            title: Container(
                              height: 50,
                              margin: EdgeInsets.all(5),
                              decoration:
                                  BoxDecoration(color: Colors.pinkAccent),
                              child: Text(
                                selectedMealdetails.steps[index],
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
