import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/widgets/grid.dart';
import 'package:flutter_application_1/widgets/list.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _isListView = true;
  bool _showSearchBar = false;

  void _toggleSearchBar() {
    setState(() {
      _showSearchBar = !_showSearchBar;
      _isListView = !_showSearchBar;
    });
  }
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
            onPressed: _toggleSearchBar,
            icon:const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isListView = !_isListView;
              });
            },
            icon: const Icon(Icons.grid_view),
          ),
        ],
      ),
      body: _showSearchBar
          ?  SearchBar(callback: _toggleSearchBar,)
          : _isListView
              ? const ListWidget()
              :  GridWidget(object:products),
    );
  }
}