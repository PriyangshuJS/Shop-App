// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String ProdTitle, String ProdId, double ProdPrice) {
    if (_items.containsKey(ProdId)) {
      _items.update(ProdId, (ExistingCartItem) {
        return CartItem(
          id: ExistingCartItem.id,
          title: ExistingCartItem.title,
          price: ExistingCartItem.price,
          quantity: ExistingCartItem.quantity + 1,
        );
      });
    } else {
      _items.putIfAbsent(ProdId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: ProdTitle,
          quantity: 1,
          price: ProdPrice,
        );
      });
    }
    notifyListeners();
  }

  void undo(String prodId) {
    if (!_items.containsKey(prodId)) return;
    if (_items[prodId]!.quantity > 1) {
      _items.update(
        prodId,
        (ExistingCartItem) {
          return CartItem(
            id: ExistingCartItem.id,
            title: ExistingCartItem.title,
            quantity: ExistingCartItem.quantity - 1,
            price: ExistingCartItem.price,
          );
        },
      );
    } else {
      _items.remove(prodId);
    }

    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartval) {
      total += cartval.price * cartval.quantity;
    });
    return total;
  }

  void removeItem(String prodId) {
    _items.remove(prodId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
