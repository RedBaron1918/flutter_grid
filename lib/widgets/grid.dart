import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_application_1/screens/product_details.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        Product product = products[index];
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
    );
  }
}
