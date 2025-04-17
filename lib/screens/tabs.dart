import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/favorite_provider.dart';
import '../provider/filters_provider.dart';
import '../provider/meal_provider.dart';
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
class TabScreen extends ConsumerStatefulWidget{
  TabScreen({super.key});

  @override
  ConsumerState<TabScreen>createState() {
    return _TabScreenState();
  }
  }

class _TabScreenState extends ConsumerState<TabScreen>{
  int selectPageIndex=0;
  void selectPage(index){
    setState((){
      selectPageIndex=index;
    });
  }
  void setScreen(String identifier)async{
    Navigator.of(context).pop();

if(identifier=='filters'){

await Navigator.of(context).push<Map<Filter,bool>>(
    MaterialPageRoute(builder:(ctx)=>FilterScreen(
    )));

}
  }
  @override
  Widget build(BuildContext context) {
    final meals=ref.watch(mealsProvider);
    final availableMeal=ref.watch(filteredMealsProvider);
    Widget activePage=Categories(
      availableMeal: availableMeal,);

    var activePageTitle="Categories";
    if(selectPageIndex==1){
      final favoritemeals=ref.watch(favoriteMealsProvider);
      activePage=MealsScreen(
          meal: favoritemeals,
          );
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

