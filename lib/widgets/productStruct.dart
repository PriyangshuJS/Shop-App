import 'package:flutter/material.dart';
import '../screens/product_detail.dart';

class ProductStructure extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductStructure(
      {required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(title),
          leading: const IconButton(
            icon: Icon(Icons.favorite),
            onPressed: null,
          ),
          backgroundColor: Colors.black54,
          trailing: const IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: null,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ProductDetail.routename, arguments: id),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
