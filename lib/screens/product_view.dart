import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_item.dart';
import '../providers/product.dart';
import '../widgets/product_grid.dart';
import '../widgets/badges.dart' as badgewidget;

enum FilterOption {
  favorites,
  all,
}

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final List<Product> loadedproducts = [];
  var _showFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption value) => {
              setState(
                () {
                  if (value == FilterOption.favorites) {
                    _showFavorites = true;
                  } else {
                    _showFavorites = false;
                  }
                },
              ),
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.favorites,
                child: Text("Favorites"),
              ),
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text("Show All"),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => badgewidget.Badge(
              color: Colors.black,
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: const IconButton(
              onPressed: null,
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: ProdutGrid(_showFavorites),
    );
  }
}
