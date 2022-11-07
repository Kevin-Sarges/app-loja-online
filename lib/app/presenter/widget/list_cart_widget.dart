// ignore_for_file: must_be_immutable

import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:transparent_image/transparent_image.dart';

class ListCart extends StatelessWidget {
  ListCart({
    Key? key,
    required this.product,
    required this.context,
    required this.onDelete,
  }) : super(key: key);

  CartModel product;
  BuildContext context;
  VoidCallback onDelete;

  final controllerService = GetIt.I.get<IDataBaseLocal>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: FadeInImage.memoryNetwork(
              width: 70,
              placeholder: kTransparentImage,
              image: product.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
