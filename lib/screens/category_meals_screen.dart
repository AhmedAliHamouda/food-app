import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routName = 'category_meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryName = routArgs['title'];
    final String categoryID = routArgs['id'];

    final meals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: meals.length,
          itemBuilder: (context, index) {
        return MealItem(
          id: meals[index].id,
          title: meals[index].title,
          imageURL: meals[index].imageUrl,
          duration: meals[index].duration,
          complexity: meals[index].complexity,
          affordability: meals[index].affordability,
        );
      },
      ),
    );
  }
}
