import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import 'product_struct.dart';

class ProdutGrid extends StatefulWidget {
  final bool showFav;
  const ProdutGrid(this.showFav, {super.key});

  @override
  State<ProdutGrid> createState() => _ProdutGridState();
}

class _ProdutGridState extends State<ProdutGrid> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        widget.showFav ? productsData.favoriteItems : productsData.item;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (c) => products[index],
        value: products[index],
        child: const ProductStructure(),
      ),
    );
  }
}
