import 'package:flutter/material.dart';

class MealPreparationScreen extends StatelessWidget {

  static const routeName = '/meal_preparation_screen';

  Widget buildListContainer(List<String> my_list_of_items, String list_name){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              list_name,
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          Center(
            child: Container(
              height: 110,
              width: 150,
              child: ListView.builder(
                itemCount: my_list_of_items.length,
                itemBuilder: (ctx, index) {
                  return Text(
                    my_list_of_items[index],
                    textAlign: TextAlign.center,
                  );
                },
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    List<String> ingredients = arguments['ingredients'];
    List<String> steps = arguments['steps'];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments["meal_title"],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Image.network(arguments["image_url"]),
              buildListContainer(ingredients, "Ingredients"),
              buildListContainer(steps, "Steps"),
            ],
          ),
        ));
  }
}
