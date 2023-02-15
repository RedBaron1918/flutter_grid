// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/screens/product_details.dart';

class GridWidget extends StatefulWidget {
  final List object;
  const GridWidget({required this.object, Key? key}) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GridView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.object.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            Product product = widget.object[index];
            return Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(details: product),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: product.productName,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/${product.img}'),
                        ),
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
