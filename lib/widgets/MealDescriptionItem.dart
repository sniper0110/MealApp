import 'package:flutter/material.dart';
import '../models/MealDescription.dart';

class MealDescriptionItem extends StatelessWidget {
  final meal_to_display;

  MealDescriptionItem({this.meal_to_display});

  String get complexity_text {
    switch (meal_to_display.complexity) {
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                child: Image.network(
                  meal_to_display.image_url,
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
                          "${meal_to_display.duration} min",
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
