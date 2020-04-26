import 'package:flutter/material.dart';

import 'MealTypesScreen.dart';
import 'FavoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selected_tab_index = 0;

  void _selectTab(int index) {
    setState(() {
      selected_tab_index = index;
    });
  }

  final List<Map<String, Object>> pages = [
    {
      'page': MealTypesScreen(),
      'title': 'Meals Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selected_tab_index]['title'],
        ),
      ),
      body: pages[selected_tab_index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selected_tab_index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
