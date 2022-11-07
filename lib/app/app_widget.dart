// ignore_for_file: unused_field

import 'package:desafio_apirest/app/presenter/views/cart_screen.dart';
import 'package:desafio_apirest/app/presenter/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedScreenIndex = 0;

  static final _screens = <Widget>[
    const HomeScreen(),
    const CartScreen(),
  ];

  void _onScreenTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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
    );
  }
}
