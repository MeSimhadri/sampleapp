import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampleapp/product_model.dart';
import 'package:flutter/services.dart' as services;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<List<ProductModel>> getProducts() async {
    final jsondata =
        await services.rootBundle.loadString('assets/products.json');
    final list = jsonDecode(jsondata) as List<dynamic>;
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            } else if (snapshot.hasData) {
              var products = snapshot.data as List<ProductModel>;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading:
                          Image.network(products[index].imageUrl.toString()),
                      title: Text(products[index].name.toString()),
                      subtitle: Text(products[index].price.toString()),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
