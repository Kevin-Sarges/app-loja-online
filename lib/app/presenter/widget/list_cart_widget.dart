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
  }) : super(key: key);

  List<CartModel>? product;
  BuildContext context;

  final controllerService = GetIt.I.get<IDataBaseLocal>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product?.length,
      itemBuilder: (_, index) {
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
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: product![index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product![index].title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${product![index].price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controllerService.onDelete(product![index].id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
