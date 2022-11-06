import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_controller.dart';
import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_state.dart';
import 'package:desafio_apirest/app/presenter/widget/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/widget/list_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controllerCart = GetIt.I.get<CartController>();

  @override
  void initState() {
    super.initState();
    controllerCart.cartProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                controllerCart.cleanCart();
                controllerCart.cartProductList();
              });
            },
            child: const Text(
              'Limpar Carrinho',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
        title: const Text(
          'Carrinho',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<CartController, CartState>(
        bloc: controllerCart,
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressWidget();
          }

          if (state is CartError) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is CartSucess) {
            if (state.productCart.isEmpty) {
              return const Center(
                child: Text('Sem produtos no carrinho!!'),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: ListCart(
                      product: state.productCart,
                      context: context,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total da compra: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$ 200',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Finalizar compra',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[400],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
