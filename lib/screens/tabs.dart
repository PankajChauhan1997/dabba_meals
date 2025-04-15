import 'package:flutter/material.dart';

import '../Model/meal.dart';
import '../widgets/main_drawer.dart';
import 'category.dart';
import 'filter.dart';
import 'meals.dart';

class TabScreen extends StatefulWidget{
  TabScreen({super.key});

  @override
  State<StatefulWidget>createState() {
    return _TabScreenState();
  }
  }

class _TabScreenState extends State<TabScreen>{
  final List<Meal>favoriteMeal=[];
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.green,content: Text(Message),));
  }
  int selectPageIndex=0;
  void selectPage(index){
    setState((){
      selectPageIndex=index;
    });
  }
  void setScreen(String identifier){
if(identifier=='filters'){
  Navigator.of(context).pop();
Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>FilterScreen()));
}
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage=Categories(onToggleFavoriteMeal:toggelMealFavoriteStatus);
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

