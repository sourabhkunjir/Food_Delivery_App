import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_cart_tile.dart';
import 'package:fooddeliveryapp/components/my_coustombutton.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold ui
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are you sure want to clear cart?"),
                        actions: [
                          //cancel button
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          //yes button
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text("yes"))
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_outlined))
            ],
          ),
          body: Expanded(
            child: Column(
              children: [
                userCart.isEmpty
                    ? Expanded(
                        child: Center(child: const Text("Cart is empty")))
                    : Expanded(
                        child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          // get individual cart item
                          final cartItem = userCart[index];

                          return MyCartTile(cartItem: cartItem);
                        },
                      )),
                MyCoustomButton(
                  text: "Go to checkout",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
