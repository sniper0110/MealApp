import 'package:flutter/material.dart';

import '../models/MealDescription.dart';
import '../widgets/MealDescriptionItem.dart';
import '../dummy-data.dart';

class MealTypeDescriptionScreen extends StatelessWidget {
  List<Meal> find_meals_by_category(id) {
    return DUMMY_MEALS.where((item) {
      return item.categories.contains(id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final meals_to_display = find_meals_by_category(arguments['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealDescriptionItem(
              meal_to_display: meals_to_display[index],
            );
          },
          itemCount: meals_to_display.length,
        ),
      ),
    );
  }
}
