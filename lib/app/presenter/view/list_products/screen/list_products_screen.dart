import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/controller_list_products/list_products_controller.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/controller_list_products/list_products_state.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/widgets_list_products/grid_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ListProductsScreen extends StatefulWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  State<ListProductsScreen> createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  final controller = GetIt.I.get<ListProductsController>();

  @override
  void initState() {
    super.initState();
    controller.listProduct();
  }

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
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<ListProductsController, ListProductsState>(
        bloc: controller,
        builder: (context, state) {
          if (state is ListProductsLoading) {
            return CircularProgressWidget(
              color: Colors.red,
            );
          }

          if (state is ListProductsError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ListProductsSucess) {
            return GridProductsWidget(
              context: context,
              product: state.result,
            );
          }

          return Container();
        },
      ),
    );
  }
}
