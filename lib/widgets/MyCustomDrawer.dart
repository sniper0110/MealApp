import 'package:flutter/material.dart';
import 'SettingsScreen.dart';


class MyCustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Cooking up!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
              //textAlign: TextAlign.center,
            ),
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            alignment: AlignmentDirectional.center,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Colors.grey,
              size: 26,
            ),
            title: Text(
              "Meals",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey,
              size: 26,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
