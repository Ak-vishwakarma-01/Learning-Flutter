import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/widgets/meal_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });
  final Meal meal;
  final void Function(BuildContext context,Meal meal) onSelectMeal;

  String get complexityText{ // it will upperCase the first word
    return meal.complexity.name[0].toUpperCase()+ meal.complexity.name.substring(1);
  }

  String get affordabilityText{ // it will upperCase the first word
    return meal.affordability.name[0].toUpperCase()+ meal.affordability.name.substring(1);
  }

  


  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //It tells the Card widget how to clip its content when it overflows the card's boundaries.Clip.hardEdge means that the content will be clipped sharply at the edge of the card, following the shape defined by the shape property (in this case, a rounded rectangle).
      clipBehavior: Clip.hardEdge, // is used to control how the content of a widget is clipped (or not clipped) when it overflows the widget's bounds
      elevation: 2,
      child: InkWell(
        onTap: (){
          onSelectMeal(context,meal);
        },
        child: Stack(
          // The Stack widget in Flutter is used to place widgets on top of each other. It allows you to overlay widgets, which is useful for creating complex UI designs where elements need to be layered.
          children: [
            FadeInImage(
              // FadeInImage is a widget that displays a placeholder image while the main image is loading. Once the main image is loaded, it fades in, replacing the placeholder. This provides a smooth transition effect and improves the user experience by showing a temporary image while the actual image is being fetched.
              placeholder: MemoryImage(kTransparentImage), // MemoryImage is used to load an image from memory. In this context, it is used to display the transparent placeholder image (kTransparentImage) while the main image is loading. // The transparent_image package provides a transparent image that can be used as a placeholder. It is a small utility package that includes a transparent PNG image, which is useful for scenarios like the one described above.
              image: NetworkImage(meal.imageUrl), //NetworkImage is used to load an image from a URL. It fetches the image over the network and displays it in the widget.
              fit:BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            Positioned( // it will forces the container to take left border and right border of the stack
              //The Positioned widget is used within a Stack to position a child widget relative to the stack's boundaries. It allows you to specify the position of the child widget using properties like top, bottom, left, and right.
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                padding:const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // very long text
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 8),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 8),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
