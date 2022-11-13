import 'package:desafio_apirest/app/domain/constants/routes_app.dart';
import 'package:desafio_apirest/app/presenter/view/home/screen/home_screen.dart';
import 'package:desafio_apirest/app/presenter/view/login/screen/login_screen.dart';
import 'package:desafio_apirest/app/presenter/view/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesApp.initalRouter: (context) => const SplashScreen(),
        RoutesApp.loginRouter: (context) => const LoginScreen(),
        RoutesApp.homeRouter: (context) => const HomeScreen(),
      },
    );
  }
}
