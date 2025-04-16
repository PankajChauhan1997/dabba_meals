import 'package:flutter/material.dart';

import '../Model/meal.dart';
import '../data/data.dart';
import '../widgets/main_drawer.dart';
import 'category.dart';
import 'filter.dart';
import 'meals.dart';


const kInitialFilters={
Filter.glutenFree:false,
Filter.lactoseFree:false,
Filter.vegetarian:false,
Filter.vegan:false
};
class TabScreen extends StatefulWidget{
  TabScreen({super.key});

  @override
  State<StatefulWidget>createState() {
    return _TabScreenState();
  }
  }

class _TabScreenState extends State<TabScreen>{
  int selectPageIndex=0;
  final List<Meal>favoriteMeal=[];
  Map<Filter,bool>_selectedFilters=kInitialFilters;
  void toggelMealFavoriteStatus(Meal meal){
    final isExisting=favoriteMeal.contains(meal);
    if(isExisting){
      setState((){
        favoriteMeal.remove(meal);
        showInfoMessage('Removed from favorites');
      });
    }else{
      setState((){
        favoriteMeal.add(meal);
        showInfoMessage('Marked as a favorites');

      });

    }
  }
  void showInfoMessage(String Message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
      backgroundColor:Colors.green,content: Text(Message),));
  }
  void selectPage(index){
    setState((){
      selectPageIndex=index;
    });
  }
  void setScreen(String identifier)async{
    Navigator.of(context).pop();

if(identifier=='filters'){
final result=await Navigator.of(context).push<Map<Filter,bool>>(
    MaterialPageRoute(builder:(ctx)=>FilterScreen(currentFilters: _selectedFilters,)));
setState((){
  _selectedFilters=result??kInitialFilters;
});
}
  }
  @override
  Widget build(BuildContext context) {
    final availableMeal=dummyMeals.where((meal){
if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
  return false;
}
if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
  return false;
}
if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
  return false;
}
if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
  return false;
}
return true;
    }).toList();
    Widget activePage=Categories(
      onToggleFavoriteMeal:toggelMealFavoriteStatus,
      availableMeal: availableMeal,);

    var activePageTitle="Categories";
    if(selectPageIndex==1){
      activePage=MealsScreen(meal: favoriteMeal, onToggleFavoriteMeal: toggelMealFavoriteStatus);
      activePageTitle="Your Favorites";
    }
 return Scaffold(
     appBar:AppBar(title:Text(activePageTitle)),
     body:activePage,
     bottomNavigationBar:BottomNavigationBar(

         items: [
       BottomNavigationBarItem(icon:Icon(Icons.set_meal) ,label:'Category'),
       BottomNavigationBarItem(icon:Icon(Icons.star) ,label:'Favorites'),
 ],
         onTap:selectPage,
       currentIndex:selectPageIndex,
     ),
     drawer:MainDrawer(onSelectScreen: setScreen)
 );
  }
  
}

