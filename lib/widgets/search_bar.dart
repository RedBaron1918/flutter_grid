import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/consts.dart';
import "package:flutter_application_1/widgets/grid.dart";

class SearchBar extends StatefulWidget {
  final Function callback;
  const SearchBar({required this.callback, super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _searchController = TextEditingController();
  late List<Product> filteredProducts = products;

  void _filterProducts(String search) {
    List<Product> filterProducts = [];
    filterProducts.addAll(products.where((product) =>
        product.productName.toLowerCase().contains(search.toLowerCase())));
    setState(() {
      if (search.isNotEmpty) {
        filteredProducts = filterProducts;
      } else {
        filteredProducts = products;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  widget.callback();
                },
              ),
            ),
            onChanged: (value) {
              _filterProducts(value);
            },
          ),
        ),
        Expanded(
          child: GridWidget(object: filteredProducts),
        )
      ],
    );
  }
}
