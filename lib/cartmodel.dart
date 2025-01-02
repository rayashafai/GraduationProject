import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  // Getter to access cart items
  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Add item to cart
  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners(); // Notify listeners to update UI
  }

  // Optionally, you can add other methods like removeFromCart, updateQuantity, etc.
  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void updateQuantity(Map<String, dynamic> product, int quantity) {
    final index = _cartItems.indexOf(product);
    if (index != -1) {
      _cartItems[index]['quantity'] = quantity;
      notifyListeners();
    }
  }
}
