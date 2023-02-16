// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/product.dart';
import 'package:flutter_application_1/screens/product_details.dart';

class ListSearch extends StatefulWidget {
  final List object;
  const ListSearch({required this.object, Key? key}) : super(key: key);

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
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
              padding: const EdgeInsets.all(3),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(details: product),
                    ),
                  );
                },
                child: Card(
                  color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: product.productName,
                        child: Image(
                          height: 70,
                          image: AssetImage('assets/${product.img}'), 
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(product.productName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
