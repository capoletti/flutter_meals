import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/categories_meals_screen.dart';
import '../screens/meal_detail_sreen.dart';

class AppRoutes {
  static const home = '/';
  static const categoriesMeals = '/categories-meals';
  static const mealDetail = '/meal-detail';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      home: ((context) => const CategoriesScreen()),
      categoriesMeals: ((context) => const CategoriesMealsScreen()),
      mealDetail: ((context) => const MealDetailSreen()),
    };
  }
}
