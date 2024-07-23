import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;

  const MyTabBar({
    super.key,
    required this.tabController,
    required this.labelStyle,
    required this.unselectedLabelStyle,
  });

  // naming of tabs // we name it as tabbar
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
      labelStyle: labelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
    );
  }
}
