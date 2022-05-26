import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/screens/home_page.dart';
import 'package:recipe_app_flutter/screens/login_page.dart';
import 'package:recipe_app_flutter/screens/recipe_details.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) {
          return HomePage();
        },
        '/login': (BuildContext context) {
          return LoginPage();
        }
      },
    );
  }
}