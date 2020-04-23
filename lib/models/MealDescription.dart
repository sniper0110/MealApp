import 'package:flutter/foundation.dart';

enum Affordability {
  AFFORDABLE,
  PRICEY,
  LUXURIOUS,
}

enum Complexity {
  SIMPLE,
  CHALLENGING,
  HARD,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String image_url;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.image_url,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
  });
}
