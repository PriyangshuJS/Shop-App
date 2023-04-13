import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartProducts extends StatelessWidget {
  final String id;
  final String prodId;
  final String title;
  final double price;
  final int quantity;

  const CartProducts(
      this.id, this.prodId, this.title, this.price, this.quantity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            Provider.of<Cart>(context, listen: false).removeItem(prodId);
          },
          key: Key(id),
          background: Container(
            margin: const EdgeInsets.all(10),
            color: Colors.deepOrange,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: Container(
                  margin: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("₹ ${price.toString()}"))),
              title: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Text("Qt - ${quantity.toString()}"),
              trailing: Text(("₹ ${price * quantity}").toString()),
            ),
          ),
        )
      ],
    );
  }
}
