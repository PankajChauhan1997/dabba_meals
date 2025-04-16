import 'package:dabba_meals/screens/meals.dart';
import 'package:dabba_meals/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/data.dart';
import 'screens/category.dart';
void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false,
      title: 'Flutter Dabba Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          // textTheme:GoogleFonts.latoTextTheme(),
      ),

      home: TabScreen(),
      // home: MealsScreen(title: 'devil', meal: dummyMeals),
    );
  }
}

