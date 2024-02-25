import 'package:flutter/material.dart';

import 'pet.dart';

class CartItem {
  final Pet pet;
  int quantity;

  CartItem({required this.pet, this.quantity = 1});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void add(Pet pet) {
    var existingItemIndex = _items.indexWhere((item) => item.pet == pet);

    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity++;
    } else {
      _items.add(CartItem(pet: pet));
    }
    notifyListeners();
  }

  void remove(Pet pet) {
    var existingItemIndex = _items.indexWhere((item) => item.pet == pet);

    if (existingItemIndex != -1) {
      var existingItem = _items[existingItemIndex];
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
      } else {
        _items.removeAt(existingItemIndex);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.pet.price * item.quantity);
}
