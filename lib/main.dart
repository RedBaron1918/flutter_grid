import 'package:flutter/material.dart';
import 'widgets/grid.dart';
import 'widgets/list.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('List of Products'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isListView = !_isListView;
                });
              },
              icon: const Icon(Icons.grid_view))
        ],
      ),
      body: _isListView ? ListWidget() : GridWidget(),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductList(),
  ));
}
