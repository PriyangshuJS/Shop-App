import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_item.dart';
import '../providers/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              OrderDetails(orderData.orders[index]),
          itemCount: orderData.orders.length,
        ));
  }
}
