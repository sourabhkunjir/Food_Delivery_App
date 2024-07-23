import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_current_location.dart';
import 'package:fooddeliveryapp/components/my_description_box.dart';
import 'package:fooddeliveryapp/components/my_food_tile.dart';
import 'package:fooddeliveryapp/components/my_silver_app_bar.dart';
import 'package:fooddeliveryapp/components/my_tab_bar.dart';
import 'package:fooddeliveryapp/models/food.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/pages/drawer_page.dart';
import 'package:fooddeliveryapp/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tabbar controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return MyFoodTile(
            food: food,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FoodPage(food: food),)) ,
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppbar(
              title: MyTabBar(
                tabController: _tabController,
                labelStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black), // Selected tab text style
                unselectedLabelStyle: TextStyle(fontSize: 8.0, color: Colors.grey), // Unselected tab text style
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  // my current location
                  const MyCurrentLocation(),

                  // description box
                  const MyDescriptionBox()
                ],
              )),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
