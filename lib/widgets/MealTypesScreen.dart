import 'package:flutter/material.dart';

import '../models/MealType.dart';
import '../dummy-data.dart';
import 'MealTypeItem.dart';

class MealTypesScreen extends StatelessWidget {
  List<MealType> meals_types = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      itemCount: meals_types.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (ctx, index) {
        return MealTypeItem(
          meal_type: meals_types[index],
        );
      },
    );
  }
}
