import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routName = 'meal-detail-screen';
  final Function toggleFav;
  final Function isFav;
  MealDetailScreen(this.toggleFav, this.isFav);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title.copyWith(
              letterSpacing: 1.0,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final idMeal = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == idMeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            buildSectionText(context, 'Ingredients'),
            Container(
              height: 150,
              width: 300,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSectionText(context, 'Steps'),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            ' ${index + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          widget.isFav(idMeal) ? Icons.star : Icons.star_border,
        ),
        onPressed: ()=> widget.toggleFav(idMeal),
      ),

    );
  }
}
