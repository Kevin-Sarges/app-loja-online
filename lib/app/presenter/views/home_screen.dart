import 'package:desafio_apirest/app/presenter/controllers/home_controller.dart';
import 'package:desafio_apirest/app/presenter/controllers/home_state.dart';
import 'package:desafio_apirest/app/presenter/widget/grid_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

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
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<HomeController, HomeState>(
        bloc: controller,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 5,
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is HomeSucess) {
            return GridHomeWidget(
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
