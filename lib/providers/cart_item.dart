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
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String ProdTitle, String ProdId, double ProdPrice) {
    if (_items.containsKey(ProdTitle)) {
      _items.update(
          ProdId,
          (ExistingCartItem) => CartItem(
                id: ExistingCartItem.id,
                title: ExistingCartItem.title,
                price: ExistingCartItem.price,
                quantity: ExistingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        ProdId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: ProdTitle,
          quantity: 1,
          price: ProdPrice,
        ),
      );
    }
    notifyListeners();
  }
}
