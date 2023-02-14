import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.product,
  });

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${product[index].img}')),
                  const SizedBox(height: 8),
                  Text(product[index].productName),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}