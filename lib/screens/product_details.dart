import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.details});
  final Product details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details.productName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(
          child:  Column(
        children: [
          Hero(
            tag: details.productName,
            child: Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 231, 231, 231)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/${details.img}"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Price:${details.price}\$",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              details.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
        ),
        )
      ),
    );
  }
}
