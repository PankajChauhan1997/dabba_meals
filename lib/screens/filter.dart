import 'package:dabba_meals/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';
import '../widgets/main_drawer.dart';


enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FilterScreen extends ConsumerWidget{
  //  FilterScreen({super.key,required this.currentFilters});
   FilterScreen({super.key,});
  // final Map<Filter,bool>currentFilters;
/*
  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }

}

class _FilterScreenState extends ConsumerState<FilterScreen>{
  var _glutenFree=false;
  var _lactoseFree=false;
  var _vegetarian=false;
  var _vegan=false;
*/
  @override
  /*
  @override
  void initState(){
    super.initState();
    final activeFilters=ref.read(filtersProvider);
     // _glutenFree=widget.currentFilters[Filter.glutenFree]!;
     // _lactoseFree=widget.currentFilters[Filter.lactoseFree]!;
     // _vegetarian=widget.currentFilters[Filter.vegetarian]!;
     // _vegan=widget.currentFilters[Filter.vegan]!;
     _glutenFree=activeFilters[Filter.glutenFree]!;
     _lactoseFree=activeFilters[Filter.lactoseFree]!;
     _vegetarian=activeFilters[Filter.vegetarian]!;
     _vegan=activeFilters[Filter.vegan]!;
  }
  */
  Widget build(BuildContext context,WidgetRef ref) {
    final filterData=ref.watch(filtersProvider);
   return Scaffold(appBar:AppBar(title:Text("Your Filters")),
     drawer:MainDrawer(onSelectScreen: (identifier){
       Navigator.of(context).pop();
       if(identifier=='meals'){
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>TabScreen()));

       }
     }),

       body:
       // WillPopScope(
       //   onWillPop: ()async {
       //     ref.read(filtersProvider.notifier).setFilters({
       //         Filter.glutenFree:_glutenFree,
       //         Filter.lactoseFree:_lactoseFree,
       //         Filter.vegetarian:_vegetarian,
       //         Filter.vegan:_vegan
       //       }
       //     );
           // Navigator.of(context).pop({
           //   Filter.glutenFree:_glutenFree,
           //   Filter.lactoseFree:_lactoseFree,
           //   Filter.vegetarian:_vegetarian,
           //   Filter.vegan:_vegan
           // });

           // return false;
         //   return true;
         // },
         // child:
         Column(children:[
           SwitchListTile(value: filterData[Filter.glutenFree]!, onChanged: (value) {
             // setState((){
               // _glutenFree=value;
               ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,value);
             // });
           },
               title:Text('Gluten-free',
                   style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
               ),  subtitle:
             Text('Only include Gluten-free meal',
               style:Theme.of(context).textTheme.labelMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
             ),
             activeColor:Theme.of(context).colorScheme.tertiary,
             contentPadding:EdgeInsets.only(left:34,right:22),
           ),
           SwitchListTile(value: filterData[Filter.lactoseFree]!, onChanged: (value) {
             // setState((){
             //   _lactoseFree=value;
             ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree,value);

             // });
           },
               title:Text('Lactose-free',
                   style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
               ),  subtitle:
             Text('Only include lactose-free meal',
               style:Theme.of(context).textTheme.labelMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
             ),
             activeColor:Theme.of(context).colorScheme.tertiary,
             contentPadding:EdgeInsets.only(left:34,right:22),
           ),
           SwitchListTile(value:filterData[Filter.vegetarian]! , onChanged: ( value) {
             // setState((){
             //   _vegetarian=value;
             // });
             ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian,value);

           },
           title:Text("Vegetarian",
               style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
               ),
             subtitle:Text("Only include vegetarian meal",
                 style:Theme.of(context).textTheme.labelMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
             ),
             activeColor:Theme.of(context).colorScheme.tertiary,
             contentPadding:EdgeInsets.only(left:34,right:22),
           ),
           SwitchListTile(value: filterData[Filter.vegan]!,
             onChanged: ( value) {
             // setState((){
             //   _vegan=value;
             // });
               ref.read(filtersProvider.notifier).setFilter(Filter.vegan,value);
         
           },
           title:Text("Vegan",
               style:Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
               ),
             subtitle:Text("Only include vegan meal",
                 style:Theme.of(context).textTheme.labelMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground),
         
             ),
             activeColor:Theme.of(context).colorScheme.tertiary,
             contentPadding:EdgeInsets.only(left:34,right:22),
           ),
         
         ]),
    //   )
    );
  }

}