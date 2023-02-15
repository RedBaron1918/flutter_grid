import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/screens/product_details.dart';
import 'package:flutter_application_1/consts.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
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
                },
              ),
            ),
            onChanged: (value) {
              _filterProducts(value);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredProducts.length,
            itemBuilder: (context, index) {
              Product product = _filteredProducts[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(details: product),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(product.productName),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${product.img}'),
                      ),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
