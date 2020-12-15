import 'package:flutter/material.dart';
import 'file:///C:/Users/ahmed/AndroidStudioProjects/food_app/lib/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String idItem;
  final String titleItem;
  final Color colorItem;

  CategoryItem({this.idItem,this.titleItem, this.colorItem});

  void selectedCategory(BuildContext context){

    Navigator.pushNamed(context, CategoryMealsScreen.routName,arguments: {
      'id' : idItem,
      'title':titleItem,
    });

    // Navigator.push(context, MaterialPageRoute(builder: (context){
    //   return CategoryMealsScreen(categoryID: idItem,categoryName: titleItem,);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.all(15.0),
            child: Text(titleItem, style: Theme.of(context).textTheme.headline6)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              colorItem.withOpacity(0.6),
              colorItem,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
