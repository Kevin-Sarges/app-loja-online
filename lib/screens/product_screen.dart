import 'package:desafio_apirest/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product, {Key? key}) : super(key: key);

  final ProductModel product;
  final SizedBox _sizedHeight = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        children: [
          Image.network(
            product.image,
            fit: BoxFit.contain,
            width: 200,
            height: 400,
          ),
          _sizedHeight,
          Text(
            'Price: \$${product.price}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _sizedHeight,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Category: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.category,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          _sizedHeight,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          _sizedHeight,
          const Text(
            'Rating: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'rate: ${product.rating.rate}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'count: ${product.rating.count}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          _sizedHeight,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              primary: Colors.red,
            ),
            child: const Text(
              'Add Cart',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
