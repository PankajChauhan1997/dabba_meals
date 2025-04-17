import 'package:flutter/material.dart';
import '../Model/category.dart';
import '../Model/meal.dart';
import '../data/data.dart';
import '../widgets/category_grid_item.dart';
import 'meals.dart';

class Categories extends StatefulWidget {
  const Categories({super.key,
  required this.availableMeal});
  final List<Meal>availableMeal;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this,
        duration:Duration(milliseconds:300),
    lowerBound:0,upperBound:1,
    );
    _animationController.forward();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context,Category category){
    final filteredMeal=widget.availableMeal
        .where((meal)=>meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>
        MealsScreen(title: category.title, meal: filteredMeal,
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,childAspectRatio:3/2,),
              children:[
              for(final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                  _selectCategory(context,category);
                },)
              ]),
      ///Explicit Animation using padding
      // builder: ( context, child)=>Padding(padding:EdgeInsets.only(
      //     top:100-_animationController.value*100), child:child),
        
        ///Explicit Animation using SlideTransition
      builder:(context,child)=>
          SlideTransition(
    position:Tween(
          begin:Offset(0,0.3),
          end:Offset(0,0)
          ).animate(CurvedAnimation(parent: _animationController,
          curve: Curves.easeInOut)),
          child:child)
    );
  }
}
