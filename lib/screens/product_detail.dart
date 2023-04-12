import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/providers/products_provider.dart';

class ProductDetail extends StatelessWidget {
  static const routename = "/productDetailScreen";

  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findbyId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(children: [
        ClipRRect(
            child: SizedBox(
          child: Image.asset(
            loadedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ))
      ]),
    );
  }
}
