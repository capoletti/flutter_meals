import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({required this.favoriteMeals, Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Widget>> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const {'title': Text('Categorias'), 'screen': CategoriesScreen()},
      {
        'title': const Text('Favoritos'),
        'screen': FavoriteSreen(favoriteMeals: widget.favoriteMeals)
      },
    ];
  }

  _selectSreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: _screens[_selectedScreenIndex]['title'] as Widget),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectSreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
