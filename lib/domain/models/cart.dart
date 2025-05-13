import 'package:example_menu/domain/models/cart_item.dart';
import 'package:example_menu/domain/models/food.dart';

class Cart {
  final List<CartItem> items = [];

  void addItem(Food food) {
    final existingItem = items.firstWhere(
      (item) => item.food.id == food.id,
      orElse: () => CartItem(food: food),
    );

    if (items.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      items.add(existingItem);
    }
  }

  void removeItem(Food food) {
    items.removeWhere((item) => item.food.id == food.id);
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}
