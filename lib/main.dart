import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/category_meals_screen.dart';
import './screens/home_screen.dart';
import 'package:food_app/screens/meal-detail-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences prefs;
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filteredData) {
    _filters = filteredData;
    availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void toggleFavorites(String mealId) {
    final exitingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
       favoriteMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) {
           return  meal.id == mealId;
          }),
        );
      });
    }
  }

    void toggleFavoritesTest(String mealId) {
    final exitingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
        favoriteMeals.removeAt(exitingIndex);

    } else {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) {
            return  meal.id == mealId;
          }),
        );

    }
  }

  bool isMealFavorite(String mealId){
      return favoriteMeals.any((element) => element.id==mealId);
  }

  //TODO: Save Data To Local Storage.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      //home: MyHomePage(),
      initialRoute: MyHomePage.routName,
      routes: {
        MyHomePage.routName: (context) => MyHomePage(favoriteMeals),
        CategoryMealsScreen.routName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routName: (context) => MealDetailScreen(toggleFavorites,isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => MyHomePage(favoriteMeals));
      },
    );
  }
}
