import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../widgets/user_product_struct.dart';
import '../providers/products_provider.dart';

class UserProducts extends StatelessWidget {
  const UserProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProduct()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Column(children: [
          UserProductStruct(
            prodId: prodData.item[index].id!,
            prodTitle: prodData.item[index].title,
            prodImg: prodData.item[index].imageUrl,
          ),
          const Divider()
        ]),
        itemCount: prodData.item.length,
      ),
    );
  }
}
