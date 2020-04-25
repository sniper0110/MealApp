import 'package:flutter/material.dart';

import '../models/MealType.dart';
import 'MealTypeDescriptionScreen.dart';


class MealTypeItem extends StatelessWidget {
  final MealType meal_type;

  MealTypeItem({this.meal_type});

  void goToDescription(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealTypeDescriptionScreen.routeName,
      arguments: {
        'id':meal_type.id,
        'title': meal_type.meal_name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToDescription(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).secondaryHeaderColor,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.orange,
                Colors.yellow,
              ],
            )),
        child: Center(
          child: Text(
            meal_type.meal_name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
