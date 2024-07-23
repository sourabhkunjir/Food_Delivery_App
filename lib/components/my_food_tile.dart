import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text food details
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name),
                    Text("\$" + food.price.toString(),style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    ),),
                    Text(food.description,style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    ),),
                  ],
                )),
                const SizedBox(width: 15,),
                // food image
                Container(
                  width: 100, 
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(food.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,indent: 25,
        )
      ],
    );
  }
}
