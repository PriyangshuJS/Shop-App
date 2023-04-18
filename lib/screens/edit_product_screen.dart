import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../providers/product.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocousNode = FocusNode();
  final _descriptionFocousNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocousNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: "",
    title: "",
    description: "",
    price: 0,
    imageUrl: "",
  );
  // var _isInit = true;
  // var _initValues = {
  //   "title": "",
  //   "price": "",
  //   "description": "",
  //   "imageUrl": "",
  // };
  @override
  void initState() {
    _imageUrlFocousNode.addListener(_updateImageUrl);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     final prodId = ModalRoute.of(context)!.settings.arguments;
  //     if (prodId != null) {
  //       _editedProduct = Provider.of<Products>(context, listen: false)
  //           .findbyId(prodId as String);
  //       _initValues = {
  //         "title": _editedProduct.title,
  //         "price": _editedProduct.price.toString(),
  //         "description": _editedProduct.description,
  //         "imageUrl": "",
  //       };
  //       _imageUrlController.text = _editedProduct.imageUrl;
  //     }
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    super.dispose();
    _priceFocousNode.dispose();
    _descriptionFocousNode.dispose();
    _imageUrlFocousNode.dispose();
    _imageUrlFocousNode.removeListener(_updateImageUrl);
  }

  void _updateImageUrl() {
    if (_imageUrlFocousNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          !_imageUrlController.text.startsWith("http") ||
          !_imageUrlController.text.endsWith(".png") &&
              !_imageUrlController.text.endsWith(".jpg") &&
              !_imageUrlController.text.endsWith(".jpeg")) {
        return;
      }
    }
    setState(() {});
  }

  void _submitForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    // if (_editedProduct.id != null) {
    //   Provider.of<Products>(context, listen: false)
    //       .updatePoduct(_editedProduct.id!, _editedProduct);
    // } else {
    //   Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    // }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        actions: [
          IconButton(
              onPressed: () => _submitForm(), icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  //initialValue: _initValues["title"],
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plese enter a Title";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocousNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: value.toString(),
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  //initialValue: _initValues["price"],
                  decoration: const InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plese enter the Price";
                    }
                    if (double.tryParse(value) == null) {
                      return "Plese enter the Price";
                    }
                    if (double.parse(value) <= 0) {
                      return "Price has to be more than zero";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocousNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocousNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value!),
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  //initialValue: _initValues["description"],
                  decoration: const InputDecoration(labelText: "Description"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plese enter the description of Product";
                    }
                    if (value.length <= 10) {
                      return "The Description has to be atleast 10 character long";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  focusNode: _descriptionFocousNode,
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: _editedProduct.title,
                        description: value.toString(),
                        price: _editedProduct.price,
                        imageUrl: _editedProduct.imageUrl);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 1)),
                      child: _imageUrlController.text.isEmpty
                          ? const Center(
                              child: Text(
                                "Enter Product Image URL",
                                textAlign: TextAlign.center,
                              ),
                            )
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        //initialValue: _initValues["imageUrl"],
                        decoration:
                            const InputDecoration(labelText: "Image URL"),
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        onChanged: (_) {
                          setState(() {});
                        },
                        focusNode: _imageUrlFocousNode,
                        onFieldSubmitted: (_) {
                          _submitForm();
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              price: _editedProduct.price,
                              imageUrl: value.toString());
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
