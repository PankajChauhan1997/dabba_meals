import 'package:flutter/material.dart';
import '../Model/category.dart';
import '../Model/meal.dart';
import '../data/data.dart';
import '../widgets/category_grid_item.dart';
import 'meals.dart';

class Categories extends StatelessWidget {
  const Categories({super.key,required this.onToggleFavoriteMeal,required this.availableMeal});
  final void Function(Meal meal) onToggleFavoriteMeal;
  final List<Meal>availableMeal;

  void _selectCategory(BuildContext context,Category category){
    final filteredMeal=availableMeal
        .where((meal)=>meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>
        MealsScreen(title: category.title??'Devil', meal: filteredMeal,
          onToggleFavoriteMeal:onToggleFavoriteMeal,)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio:3/2,),
            children:[
            for(final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                _selectCategory(context,category);
              },)
            ]);
  }
}
