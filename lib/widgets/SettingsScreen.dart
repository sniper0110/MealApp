import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  static String routeName = '/settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Text("This is the settings screen!"),
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
