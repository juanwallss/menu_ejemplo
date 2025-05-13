import 'package:flutter/material.dart';
import 'package:example_menu/domain/models/cart.dart';
import 'package:example_menu/domain/models/food.dart';

class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addToCart(Food food) {
    _cart.addItem(food);
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.removeItem(food);
    notifyListeners();
  }

  void addManyToCart(Food food, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.addItem(food);
    }
    notifyListeners();
  }
}