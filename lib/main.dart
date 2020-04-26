import 'package:flutter/material.dart';

import './widgets/MealTypesScreen.dart';
import './widgets/MealTypeDescriptionScreen.dart';
import './widgets/MealPreparationScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        secondaryHeaderColor: Colors.deepOrangeAccent.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => MealTypesScreen(),
        MealTypeDescriptionScreen.routeName : (_) => MealTypeDescriptionScreen(),
        MealPreparationScreen.routeName : (_) => MealPreparationScreen(),
      },
    );
  }
}


