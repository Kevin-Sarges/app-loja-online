import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/view/home/widgets_home/grid_home_widget.dart';
import 'package:desafio_apirest/app/presenter/view/home/controller_home/home_controller.dart';
import 'package:desafio_apirest/app/presenter/view/home/controller_home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = GetIt.I.get<HomeController>();

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
      body: BlocBuilder<HomeController, HomeState>(
        bloc: controller,
        builder: (context, state) {
          if (state is HomeLoading) {
            return CircularProgressWidget(
              color: Colors.red,
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
