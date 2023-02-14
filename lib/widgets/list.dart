import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.product,
  });

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              title: Text(product[index].productName),
              leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${product[index].img}')),
            ),
          ),
        );
      },
    );
  }
}