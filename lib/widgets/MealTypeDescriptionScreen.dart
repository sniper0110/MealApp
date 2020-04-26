import 'package:flutter/material.dart';

import '../models/MealDescription.dart';
import '../widgets/MealDescriptionItem.dart';
import '../dummy-data.dart';

class MealTypeDescriptionScreen extends StatefulWidget {

  static const routeName = '/meal_type_description';

  @override
  _MealTypeDescriptionScreenState createState() => _MealTypeDescriptionScreenState();
}

class _MealTypeDescriptionScreenState extends State<MealTypeDescriptionScreen> {
  Map<String, Object> arguments;

  List<Meal> meals_to_display;

  bool _isChanged = false;

  List<Meal> find_meals_by_category(id) {
    return DUMMY_MEALS.where((item) {
      return item.categories.contains(id);
    }).toList();
  }

  @override
  void didChangeDependencies() {
    if(!_isChanged){
      // TODO: implement didChangeDependencies
      arguments = ModalRoute.of(context).settings.arguments as Map<String, Object>;
      meals_to_display = find_meals_by_category(arguments['id']);
      _isChanged = true;
    }


    super.didChangeDependencies();
  }

  void _remove_item(mealId){
    meals_to_display.removeWhere((item){
      return item.id == mealId;
    });

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealDescriptionItem(
              meal_to_display: meals_to_display[index],
              remove_meal: _remove_item,
            );
          },
          itemCount: meals_to_display.length,
        ),
      ),
    );
  }
}
