// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_application_1/screens/product_details.dart';
import 'package:flutter_application_1/classes/product.dart';
class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
    late final TextEditingController _searchController = TextEditingController();
     late List<Product> _filteredProducts = products.toList();

  void _filterProducts(String search) {
    List<Product> filterProducts = [];
    filterProducts.addAll(products.where((product) =>
        product.productName.toLowerCase().contains(search.toLowerCase())));
    setState(() {
      _filteredProducts = filterProducts;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: TextField(
            key: const Key('search-field'),
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search products',
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  _filterProducts('');
                },
              ),
            ),
            onChanged: (value) {
              _filterProducts(value);
            },
          ),
        ),
        Expanded(child: GridView.builder(
      itemCount: _filteredProducts.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        final product = _filteredProducts[index];
        return Padding(
          padding: const EdgeInsets.all(6),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(details: product),
                ),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/${product.img}'),
                  ),
                  const SizedBox(height: 8),
                  Text(product.productName),
                ],
              ),
            ),
          ),
        );
      },
    ))
      ],
      
    );
  }
}


