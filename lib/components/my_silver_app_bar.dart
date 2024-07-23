import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/cart_page.dart';

class MySilverAppbar extends StatelessWidget {
  final Widget title;
  final Widget child;

  const MySilverAppbar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Sunset Dinner"),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              // go to card page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
