import 'package:flutter/material.dart';


import 'MealTypesScreen.dart';
import 'FavoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
          ),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Meals categories",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favorites",
            ),
          ]),
        ),
        body: TabBarView(children: [
          MealTypesScreen(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
