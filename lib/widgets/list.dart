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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(details: product),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(product.productName),
                      leading: Hero(
                        tag: product.productName,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/${product.img}'),
                        ),
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
