// ignore_for_file: must_be_immutable

import 'package:desafio_apirest/model/product_model.dart';
import 'package:desafio_apirest/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GridHomeWidget extends StatelessWidget {
  GridHomeWidget({
    Key? key,
    required this.context,
    required this.product,
  }) : super(key: key);

  BuildContext context;
  List<ProductModel>? product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 4,
        childAspectRatio: 0.52,
      ),
      itemCount: product?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(product![index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeInImage.memoryNetwork(
                  width: 140,
                  height: 200,
                  placeholder: kTransparentImage,
                  image: product![index].image,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product![index].title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
