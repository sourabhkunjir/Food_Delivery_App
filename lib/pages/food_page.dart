import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddeliveryapp/components/my_coustombutton.dart';
import 'package:fooddeliveryapp/models/food.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to menu
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      currentlySelectedAddons.add(addon);
    }

    //add to cart
    context.read<Restaurant>().addTocart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    // mediaquery of users screen width
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
            body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //food image
            Container(
              width: width,
              height: width - 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.food.imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //food name
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    //food price
                    Text(
                      "\$" + widget.food.price.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //food desciption
                    Text(
                      widget.food.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    //addons
                    Text(
                      "Add-ons",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // get individual addon
                        Addon addon = widget.food.availableAddons[index];
                        // return checkbox UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(addon.price.toString()),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                    //button add to cart
                    MyCoustomButton(
                      text: "Add to Cart",
                      onTap: () {
                        addToCart(widget.food ,widget.selectedAddons);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ]),
        )),
        // stack back button
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded)),
          ),
        )
      ],
    );
  }
}
