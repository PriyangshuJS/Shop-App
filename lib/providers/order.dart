import 'package:flutter/foundation.dart';

import './cart_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.date});
}

class Order with ChangeNotifier {
  // ignore: prefer_final_fields
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> orderProd, double orderAmount) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: orderAmount,
        products: orderProd,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
