import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product.dart';
import '../screens/product_detail.dart';

class ProductStructure extends StatefulWidget {
  const ProductStructure({super.key});

  @override
  State<ProductStructure> createState() => _ProductStructureState();
}

class _ProductStructureState extends State<ProductStructure> {
//   final String id;
  @override
  Widget build(BuildContext context) {
    final productSt = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(productSt.title),
          leading: Consumer<Product>(
            builder: (context, loadedProduct, child) => IconButton(
              icon: Icon(
                productSt.favorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  productSt.toggleFavoriteStatus();
                });
              },
            ),
          ),
          backgroundColor: Colors.black54,
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () =>
                cart.addItem(productSt.title, productSt.id, productSt.price),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ProductDetail.routename, arguments: productSt.id),
          child: Image.network(
            productSt.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
