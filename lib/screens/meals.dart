import 'package:flutter/material.dart';

import '../Model/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen( {super.key,this.title,
  required this.meal,
  });

  final String? title;
  final List<Meal> meal;
  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>
        MealDetails(meal: meal,
        )
    ));
  }
  @override
  Widget build(BuildContext context){
    Widget content=Center(child:Column(mainAxisSize:MainAxisSize.min,
        children:[
          Text("Uh ooh......",
              style:Theme.of(context).textTheme.headlineLarge!.copyWith(color:Theme.of(context).colorScheme.onSurface)),
          SizedBox(height:16),
          Text("Try selecting the different catagory...",
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onSurface))


        ]));
    if(meal.isNotEmpty){
    content=ListView.builder(
      itemCount:meal.length,
      itemBuilder: (context,index) =>
        MealItem(meal: meal[index], onSelectMeal:selectMeal,)

    );

    }
    if(title==null){
      return content;
    }
    return Scaffold(
        appBar:AppBar(title:Text(title!)),
        body:content
    );
  }


}