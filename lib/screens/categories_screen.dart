import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categoriesData
          .map(
            (e) => CategoryItem(
              idItem: e.id,
              titleItem: e.title,
              colorItem: e.color,
            ),
          )
          .toList(),
    );
  }
}
