import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/constants.dart';
import "package:flutter_application_1/widgets/grid.dart";
import 'package:flutter_application_1/widgets/item_list_search.dart';

class SearchBar extends StatefulWidget {
  final Function callback;
  const SearchBar({required this.callback, super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = products;

  void _filterProducts(String search) {
    filteredProducts = products
        .where((product) =>
            product.productName.toLowerCase().contains(search.toLowerCase()))
        .toList();
    setState(() {});
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
          child:products.length == filteredProducts.length ? GridWidget(object: filteredProducts) :ListSearch(object: filteredProducts) ,
        )
      ],
    );
  }
}
