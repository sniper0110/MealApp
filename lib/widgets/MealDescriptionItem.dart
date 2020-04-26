import 'package:flutter/material.dart';
import '../models/MealDescription.dart';
import 'MealPreparationScreen.dart';

class MealDescriptionItem extends StatefulWidget {
  final Meal meal_to_display;
  final Function remove_meal;

  MealDescriptionItem({this.meal_to_display, this.remove_meal});

  @override
  _MealDescriptionItemState createState() => _MealDescriptionItemState();
}

class _MealDescriptionItemState extends State<MealDescriptionItem> {
  String get complexity_text {
    switch (widget.meal_to_display.complexity) {
      case Complexity.SIMPLE:
        return "Simple";

      case Complexity.CHALLENGING:
        return "Challenging";

      case Complexity.HARD:
        return "Hard";

      default:
        return "Unknown";
    }
  }

  void goToMealPreparationScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealPreparationScreen.routeName,
      arguments: {
        "id":widget.meal_to_display.id,
        "meal_title":widget.meal_to_display.title,
        "image_url":widget.meal_to_display.image_url,
        "ingredients":widget.meal_to_display.ingredients,
        "steps":widget.meal_to_display.steps,
      },
    ).then((result){
      print(result);
      if(result != null){
        widget.remove_meal(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMealPreparationScreen(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Card(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      widget.meal_to_display.image_url,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      width: 150,
                      child: Text(
                        widget.meal_to_display.title,
                        style: TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white70,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.meal_to_display.duration} min",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$complexity_text",
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ),
            ],
          ),
          color: Colors.white70,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
