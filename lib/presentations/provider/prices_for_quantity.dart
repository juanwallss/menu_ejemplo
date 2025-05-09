import 'package:flutter/material.dart';

class PricesForQuantity with ChangeNotifier {
  double price = 0;
  int quantity = 1;
  double totalPrice = 0;

  void setPrice(double newPrice) {
    price = newPrice;
    totalPrice = quantity * price;
  }

  void setQuantity(int newQuantity) {
    quantity = newQuantity;
    notifyListeners();
  }

  void addQuantity() {
    quantity++;
    totalPrice = quantity * price;
    notifyListeners();
  }

  void removeQuantity() {
    if (quantity > 0) {
      quantity--;
      totalPrice = quantity * price;
      notifyListeners();
    }
  }

  double getTotalPrice() {
    return totalPrice;
  }

  void resetValues() {
    price = 0;
    quantity = 1;
    totalPrice = 0;
    notifyListeners();
  }
}
