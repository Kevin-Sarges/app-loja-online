import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/presenter/view/cart/screen/cart_screen.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/screen/list_products_screen.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  final controllerLogin = GetIt.I.get<IAuthUser>();

  static final _screens = <Widget>[
    const ListProductsScreen(),
    const CartScreen(),
  ];

  void _onScreenTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginController(controllerLogin),
        child: SafeArea(
          child: Scaffold(
            body: _screens.elementAt(_selectedScreenIndex),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.red,
              currentIndex: _selectedScreenIndex,
              onTap: _onScreenTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Carrinho',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
