import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';

import '../screens/edit_product_screen.dart';

class UserProductStruct extends StatelessWidget {
  final String prodId;
  final String prodTitle;
  final String prodImg;
  const UserProductStruct({
    super.key,
    required this.prodId,
    required this.prodTitle,
    required this.prodImg,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(prodTitle),
      leading: CircleAvatar(backgroundImage: NetworkImage(prodImg)),
      trailing: IconButton(
          onPressed: () {
            Provider.of<Products>(context, listen: false).deleteProd(prodId);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.deepOrange,
          )),
    );
  }
}
