import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/cart_item.dart';
import 'package:fooddeliveryapp/models/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy burger with cheese, lettuce, and tomato.",
      imagePath: "assets/images/burger1.jpg",
      price: 8.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Avocado", price: 0.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description: "A delicious burger with BBQ sauce and crispy bacon.",
      imagePath: "assets/images/burger2.jpg",
      price: 9.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Bacon", price: 1.50),
        Addon(name: "Onion Rings", price: 1.00),
      ],
    ),
    // salads
    Food(
      name: "Caesar Salad",
      description: "Fresh romaine lettuce with Caesar dressing.",
      imagePath: "assets/images/salad1.jpg",
      price: 7.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.50),
        Addon(name: "Croutons", price: 0.50),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "A healthy salad with olives, feta cheese, and tomatoes.",
      imagePath: "assets/images/salad2.jpg",
      price: 7.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Feta", price: 1.00),
        Addon(name: "Olives", price: 0.75),
      ],
    ),
    // sides
    Food(
      name: "French Fries",
      description: "Crispy golden french fries.",
      imagePath: "assets/images/sides1.jpg",
      price: 3.00,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ketchup", price: 0.25),
        Addon(name: "Cheese Sauce", price: 0.75),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Deep-fried onion rings with a crispy coating.",
      imagePath: "assets/images/sides2.jpg",
      price: 3.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dressing", price: 0.50),
        Addon(name: "BBQ Sauce", price: 0.50),
      ],
    ),
    // desserts
    Food(
      name: "Chocolate Cake",
      description: "Rich and moist chocolate cake.",
      imagePath: "assets/images/dessert1.jpg",
      price: 4.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.00),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "Creamy cheesecake with a graham cracker crust.",
      imagePath: "assets/images/dessert2.jpg",
      price: 4.75,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Strawberry Sauce", price: 0.75),
        Addon(name: "Blueberry Sauce", price: 0.75),
      ],
    ),
    // drinks
    Food(
      name: "Coke",
      description: "Refreshing Coca-Cola.",
      imagePath: "assets/images/drink1.jpg",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon", price: 0.25),
        Addon(name: "Ice", price: 0.10),
      ],
    ),
    Food(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice.",
      imagePath: "assets/images/drink2.jpg",
      price: 2.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Mint", price: 0.25),
      ],
    ),
  ];

  // it,s pure backend iguesss used for local database like sqlive/hive=======================================================================
  //=====================================================================
  //getters --------------------------------------------------------------
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //operations-----------------------------------------------------------------------
  // user cart
  final List<CartItem> _cart = [];

  // 1.add to cart
  void addTocart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food annd selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    // if item already exists, increase it't quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise ,add a new cart items to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  // 2.remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // // 3.get total price of cart
  // double getTotalPrice() {
  //   double total = 0.0;

  //   for (CartItem cartItem in _cart) {
  //     double itemTotal = cartItem.food.price;

  //     for (Addon addon in cartItem.selectedAddons) {
  //       itemTotal += addon.price;
  //     }

  //     total += itemTotal * cartItem.quantity;
  //   }
  //   return total;
  // }

  // // 4.total number of items in cart
  // int getTotalItemCount() {
  //   int totalItemCount = 0;

  //   for (CartItem cartItem in _cart) {
  //     totalItemCount += cartItem.quantity;
  //   }
  //   return totalItemCount;
  // }

  // 5.clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
