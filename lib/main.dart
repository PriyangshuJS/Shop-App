import 'package:flutter/material.dart';

import './screens/product_detail.dart';
import './screens/product_view.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "Lato",
      ),
      home: ProductView(),
      routes: {
        ProductDetail.routename: (context) => const ProductDetail(),
      },
    );
  }
}
