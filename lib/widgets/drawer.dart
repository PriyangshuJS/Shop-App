import 'package:flutter/material.dart';

import '../screens/user_product.dart';
import '../screens/order_screen.dart';
import '../screens/product_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProductView()));
            },
            title: const Text(
              "Shop",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.shop,
              size: 30,
            )),
        const Divider(),
        ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrderScreen()));
            },
            title: const Text(
              "Orders",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.payment,
              size: 30,
            )),
        const Divider(),
        ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserProducts()));
            },
            title: const Text(
              "User Product",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.verified_user,
              size: 30,
            )),
      ]),
    );
  }
}
