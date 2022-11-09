import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/carrinho.png',
            width: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Sem produtos no carrinho!!'),
        ],
      ),
    );
  }
}
