import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealPreparationScreen extends StatelessWidget {
  static const routeName = '/meal_preparation_screen';

  Widget buildListContainer(List<String> my_list_of_items, String list_name) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              list_name,
              textAlign: TextAlign.center,
              style: GoogleFonts.greatVibes(
                fontSize: 20,
              ),
            ),
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: my_list_of_items.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "# ${index + 1}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      radius: 17,
                    ),
                    title: Text(
                      my_list_of_items[index],
                      style: GoogleFonts.greatVibes(
                        fontSize: 20,
                      ),
                    ),
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

  void _delete_recipe(BuildContext context, mealId) {
    Navigator.of(context).pop(mealId);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    List<String> ingredients = arguments['ingredients'];
    List<String> steps = arguments['steps'];
    String mealId = arguments['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments["meal_title"],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(arguments["image_url"]),
              buildListContainer(ingredients, "Ingredients"),
              buildListContainer(steps, "Steps"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _delete_recipe(context, mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
