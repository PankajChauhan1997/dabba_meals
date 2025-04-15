import 'package:flutter/material.dart';

import '../Model/category.dart';
import '../Model/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key,
    required this.meal,
    required this.onToggleFavoriteMeal
  }) : super(key: key);

  final Meal meal;
  final void Function(Meal meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text(meal.title),actions:[
          IconButton(onPressed: () {
            onToggleFavoriteMeal(meal);
            },
            icon: Icon(Icons.star),)
        ]),
body:SingleChildScrollView(
  child: Column(
    children: [
      Image.network(width:double.infinity,height:300,fit:BoxFit.cover,meal.imageUrl),
      SizedBox(height:14),
      Text("Ingredients",style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary)),
      SizedBox(height:14),
      for(final ingredient in meal.ingredients)
        Text(ingredient,style:Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.primary)),
      SizedBox(height:24),
      Text("Steps",style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary)),
      SizedBox(height:14),
      for(final step in meal.steps)
        Padding(
          padding: const EdgeInsets.symmetric(vertical:.0,horizontal:12),
          child: Text(step,textAlign:TextAlign.center,style:Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.primary)),
        ),
      SizedBox(height:24),
    ],
  ),
)
    );
  }
}
