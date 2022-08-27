import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeal = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(category.title)),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: ((context, index) {
            return MealItem(meal: categoryMeal[index]);
          }),
        ),
      ),
    );
  }
}
