import 'package:flutter/material.dart';

class CartProducts extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CartProducts(this.id, this.title, this.price, this.quantity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Card(
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text("Qt - ${quantity.toString()}"),
            trailing: Text(("₹ ${price * quantity}").toString()),
          ),
        )
      ],
    );
  }
}
