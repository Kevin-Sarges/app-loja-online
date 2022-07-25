import 'package:desafio_apirest/model/product_model.dart';
import 'package:desafio_apirest/provider/product_provider.dart';
import 'package:desafio_apirest/widget/grid_home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider provider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder<List<ProductModel>?>(
        future: provider.getProduct(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 5,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                final List<ProductModel>? data = snapshot.data;

                return GridHomeWidget(
                  context: context,
                  product: data,
                );
              }
          }
        },
      ),
    );
  }
}
