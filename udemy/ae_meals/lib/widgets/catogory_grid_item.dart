import 'package:flutter/material.dart';
import 'package:ae_meals/models/category.dart';

class CatogoryGridItem extends StatelessWidget{
  const CatogoryGridItem(
  {
    super.key, 
    required this.category,
    required this.onSelectCategory,
  });

  final Catogory category;
  final void Function() onSelectCategory; 

  @override
  Widget build(BuildContext context) {
    //InkWell is the material widget in flutter. It responds to the touch action as performed by the user. Inkwell will respond when the user clicks the button. There are so many gestures like double-tap, long press, tap down, etc. Below are the so many properties of this widget. We can set the radius of the inkwell widget using radius and also border-radius using borderRadius. We can give the splash color using splashColor and can do a lot of things.
    return InkWell(
      onTap: onSelectCategory, 
      splashColor: Theme.of(context).primaryColor,  // splash on onTap
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin:const EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(   // it will give nice gradient opacity
            colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.9)  
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title, 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, // at the place on on backgound(deprected)
          ) ,
        ),
      ),
    );
  }
}