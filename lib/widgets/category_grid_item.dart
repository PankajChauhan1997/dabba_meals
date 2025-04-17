import 'package:flutter/material.dart';

import '../Model/category.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({super.key,
  required this.category,
  required this.onSelectCategory
  });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(onTap:onSelectCategory,
      splashColor:Theme.of(context).primaryColor,
    borderRadius:BorderRadius.circular(8),
    child: Container(padding:EdgeInsets.all(8),
        decoration:BoxDecoration(borderRadius:BorderRadius.circular(8),
            gradient:LinearGradient(colors: [
        category.color.withValues(alpha: 0.55),
        category.color.withValues(alpha: 0.9),
        ],begin:Alignment.topLeft,
        end:Alignment.bottomRight,
        )),
        child:Text(category.title)),
  ),
);
  }
}