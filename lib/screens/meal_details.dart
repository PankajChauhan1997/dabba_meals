import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/meal.dart';
import '../provider/favorite_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteMeals=ref.watch(favoriteMealsProvider);
    final isFavorite=favoriteMeals.contains(meal);
    return Scaffold(
        appBar:AppBar(title:Text(meal.title),actions:[
          IconButton(onPressed: () {
           final wasAdded= ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor:Colors.green,content: Text(wasAdded?"Meal added as a favorite":"Meal removed"),));
            },
            icon: Icon(isFavorite?Icons.star:Icons.star_border))
        ]),
body:SingleChildScrollView(
  child: Column(
    children: [
      Image.network(width:double.infinity,height:300,fit:BoxFit.cover,meal.imageUrl),
      SizedBox(height:14),
      Text("Ingredients",style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onSurface)),
      SizedBox(height:14),
      for(final ingredient in meal.ingredients)
        Text(ingredient,style:Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.onSurface)),
      SizedBox(height:24),
      Text("Steps",style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onSurface)),
      SizedBox(height:14),
      for(final step in meal.steps)
        Padding(
          padding: const EdgeInsets.symmetric(vertical:.0,horizontal:12),
          child: Text(step,textAlign:TextAlign.center,style:Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.onSurface)),
        ),
      SizedBox(height:24),
    ],
  ),
)
    );
  }
}
