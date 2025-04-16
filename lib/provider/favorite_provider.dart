
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier():super([]);


  bool toggleMealFavoriteStatus(Meal meal){
    final isMealFavorite=state.contains(meal);
    if(isMealFavorite){
      state=state.where((m)=>m.id!=meal.id).toList();
      return false;
    }else{
state=[...state,meal];
return true;
    }
  }
}
final favoriteMealsProvide=StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});