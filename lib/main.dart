import 'package:flutter/material.dart';
import 'classes/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(img: "cheese.jpg",price: 20,productName: "cheese"),
    Product(img: "egg.jpg",price: 10,productName: "egg"),
    Product(img: "milk.jpg",price: 3,productName: "milk"),
    Product(img: "soap.jpg",price: 4,productName: "soap"),
    Product(img: "shampoo.jpg",price: 5,productName: "shampoo"),
    Product(img: "meat.jpg",price: 30,productName: "meat"),
  ];

  bool _isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:const Text('List of Products'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isListView = !_isListView;
              });
            },
            icon: Icon(Icons.grid_view)
          )
        ],
        elevation: 0,
      ),
      body: _isListView
        ? ListView.builder(
            itemCount:products.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child:ListTile(
                    title: Text(products[index].productName),
                    leading: CircleAvatar(backgroundImage: AssetImage('assets/${products[index].img}')),
                  ),
                ),
              );
            },
          )
        : GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundImage: AssetImage('assets/${products[index].img}')),
                        SizedBox(height: 8),
                        Text(products[index].productName),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: ProductList(),
    ),
  ));
}