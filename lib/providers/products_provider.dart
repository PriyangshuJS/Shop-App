import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://i.pinimg.com/564x/0d/bb/93/0dbb934911d2918162c7a865f00e4041.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Lenovo LP2',
      description: 'Lenovo LP2 TWS bluetooth 5.0 Earphone',
      price: 49.99,
      imageUrl:
          'https://i.pinimg.com/564x/e5/15/4c/e5154c12ac9d5b970f3842c74785b7e5.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Blue Sneakers',
      description: 'Stylish and comfortable blue sneakers for any occasion.',
      price: 79.99,
      imageUrl:
          'https://i.pinimg.com/564x/0b/91/ec/0b91ec49976d718df6a49c3883031ad5.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Leather Wallet',
      description:
          'A sleek and durable leather wallet to keep your essentials safe.',
      price: 39.99,
      imageUrl:
          'https://i.pinimg.com/564x/24/0d/a4/240da46d04a6aaf4c50e08813cb7f0c2.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Eudora H Deo Colônia',
      description: 'Eudora H Deo .',
      price: 129.99,
      imageUrl:
          'https://i.pinimg.com/564x/3b/20/4a/3b204ab877f3a599ec7c30645f13d1b3.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Sports Watch',
      description:
          'A durable and stylish sports watch for your active lifestyle.',
      price: 99.99,
      imageUrl:
          'https://i.pinimg.com/564x/f5/50/ba/f550baeaf497bd841483450631b4c05e.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Wireless Headphones',
      description:
          'Experience high-quality sound and wireless freedom with these headphones.',
      price: 149.99,
      imageUrl:
          'https://i.pinimg.com/564x/9b/39/fb/9b39fb56a844ceab1fe852f7a26941a6.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Coffee Maker',
      description:
          'Enjoy delicious coffee from the comfort of your own home with this coffee maker.',
      price: 89.99,
      imageUrl:
          'https://i.pinimg.com/564x/37/d9/b9/37d9b9994848778cf383326c7b3cf9c6.jpg',
    ),
    Product(
      id: 'p11',
      title: 'Smart Watch',
      description:
          'Stay connected and track your fitness with this smart watch.',
      price: 199.99,
      imageUrl:
          'https://i.pinimg.com/736x/cd/48/c9/cd48c920eaceadcc92aed1d555d62334.jpg',
    ),
    Product(
      id: 'p12',
      title: 'Portable Bluetooth Speaker',
      description:
          'Take your music on the go with this portable Bluetooth speaker.',
      price: 79.99,
      imageUrl:
          'https://i.pinimg.com/564x/bd/ab/c4/bdabc47e32d0770253c1899894e30648.jpg',
    ),
    Product(
      id: 'p13',
      title: 'Air Fryer',
      description:
          'Fry your favorite foods with less oil using this air fryer.',
      price: 129.99,
      imageUrl:
          'https://i.pinimg.com/564x/1d/94/f6/1d94f6abfd5a09cf8f49f62fb833654b.jpg',
    )
  ];

  List<Product> get item {
    return [..._item];
  }

  List<Product> get favoriteItems {
    return _item.where((prodItem) => prodItem.favorite).toList();
  }

  Product findbyId(String id) {
    return _item.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _item.add(newProduct);
    notifyListeners();
  }

  void updatePoduct(String id, Product newProduct) {
    final prodIndex = _item.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _item[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProd(String id) {
    _item.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
