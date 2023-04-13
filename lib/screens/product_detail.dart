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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: Image.network(loadedProduct.imageUrl),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                loadedProduct.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\$ ${loadedProduct.price.toString()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(loadedProduct.description),
            ],
          ),
        ));
  }
}
