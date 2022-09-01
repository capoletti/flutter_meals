import 'package:flutter/material.dart';
import '../models/setting.dart';
import '../data/dummy_data.dart';
import '../utils/app_routes.dart';
import '../models/meal.dart';
import '../screens/settings_sreen.dart';
import '../screens/tabs_screen.dart';
import '../screens/categories_meals_screen.dart';
import '../screens/meal_detail_sreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final fIsGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final fILactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final fIsVegan = settings.isVegan && !meal.isVegan;
        final fIsVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !fIsGlutenFree && !fILactoseFree && !fIsVegan && !fIsVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: "Raleway",
        primaryColor: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
      ),
      routes: {
        AppRoutes.home: ((context) =>
            TabsScreen(favoriteMeals: _favoriteMeals)),
        AppRoutes.categoriesMeals: ((context) =>
            CategoriesMealsScreen(meals: _availableMeals)),
        AppRoutes.mealDetail: ((context) => MealDetailSreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite)),
        AppRoutes.settings: ((context) =>
            SettingsSreen(settings: settings, onSettingsChanged: _filterMeals)),
      },
    );
  }
}
