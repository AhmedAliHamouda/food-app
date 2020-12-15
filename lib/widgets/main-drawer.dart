import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/home_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ListTileDrawer(
            text: 'Meals',
            iconData: Icons.restaurant,
            onTapped: (){
              Navigator.pushReplacementNamed(context, MyHomePage.routName);
            },
          ),
          ListTileDrawer(
            text: 'Filters',
            iconData: Icons.settings,
            onTapped: (){
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class ListTileDrawer extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTapped;
  ListTileDrawer({this.text,this.iconData,this.onTapped});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26.0,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      onTap: onTapped,
    );
  }
}
