import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      routes: AppRoutes.routes(),
    );
  }
}
