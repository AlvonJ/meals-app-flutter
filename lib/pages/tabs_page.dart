import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_page.dart';
import './categories_page.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  const TabsPage(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>>? _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesPage(widget.favoriteMeals), 'title': 'Your favorite'},
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DefaultTabController for appbar in the top
    //   return DefaultTabController(
    //       length: 2,
    //       // initialIndex: 0,
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text('Meals'),
    //           bottom: const TabBar(
    //             tabs: [
    //               Tab(
    //                 icon: Icon(Icons.category),
    //                 text: 'Categories',
    //               ),
    //               Tab(
    //                 icon: Icon(Icons.star),
    //                 text: 'Favorites',
    //               )
    //             ],
    //           ),
    //         ),
    //         body: TabBarView(
    //           children: [CategoriesScreen(), FavoritesPage()],
    //         ),
    //       ));
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages?[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages?[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
