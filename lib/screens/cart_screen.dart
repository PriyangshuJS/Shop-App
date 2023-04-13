import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, i) => CartProducts(
            cart.items.values.toList()[i].id,
            cart.items.keys.toList()[i],
            cart.items.values.toList()[i].title,
            cart.items.values.toList()[i].price,
            cart.items.values.toList()[i].quantity,
          ),
          itemCount: cart.itemCount,
        )),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 15,
          margin: const EdgeInsets.all(15),
          child: ListTile(
            leading: const Text(
              "Total",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            title: Text(
              "\t\t₹${cart.totalAmount.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            trailing: OutlinedButton(
                onPressed: () {
                  Provider.of<Order>(context, listen: false).addOrder(
                    cart.items.values.toList(),
                    cart.totalAmount,
                  );
                  cart.clear();
                },
                child: const Text("Order Now")),
          ),
        ),
      ]),
    );
  }
}
