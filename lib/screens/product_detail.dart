import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const routename = "/productDetailScreen";

  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ghgjg"),
      ),
    );
  }
}
