import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/favorite-screen.dart';
import 'package:food_app/widgets/main-drawer.dart';
import '../screens/categories_screen.dart';

class MyHomePage extends StatefulWidget {
  static const String routName = 'home_screen';


  final List<Meal> favMeals;

  MyHomePage(this.favMeals);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _selectedIndex = 0;
  // final List<Map<String, Object>> _pages = [
  //   {'page': CategoriesScreen(), 'title': 'Categories'},
  //   {'page': FavoriteScreen(), 'title': 'Favorites'},
  // ];
  final List<String> _pagesTitles=['Categories','Favorites'];

  void selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //TODO: this to use tap bar items to press it
  void navigationTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text(_pagesTitles[_selectedIndex]),
      ),
      drawer: MainDrawer(),
      body: PageView(
        children: [
          CategoriesScreen(),
          FavoriteScreen(widget.favMeals),
        ],
        onPageChanged: selectedPage,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
