import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import '../widgets/meal_item.dart';
class FavoriteScreen extends StatefulWidget {

  final List<Meal> favoritesMeals;

  FavoriteScreen(this.favoritesMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {

    return  widget.favoritesMeals.isEmpty ?
    Center(child: Text('No Favorites Meal Added Yet! add your Fav Meals'),) :
       ListView.builder(
       itemCount: widget.favoritesMeals.length,
        itemBuilder: (context, index) {

        return MealItem(
          id: widget.favoritesMeals[index].id,
          title: widget.favoritesMeals[index].title,
          imageURL: widget.favoritesMeals[index].imageUrl,
          duration: widget.favoritesMeals[index].duration,
          complexity: widget.favoritesMeals[index].complexity,
          affordability: widget.favoritesMeals[index].affordability,
        );
      },
    );
    // if(widget.favoritesMeals.isEmpty){
    //   return Center(child: Text('No Favorites Meal Added Yet! add your Fav Meals'),);
    // }
  }
}
