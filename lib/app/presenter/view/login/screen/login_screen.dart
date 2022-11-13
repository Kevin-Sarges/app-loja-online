import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/presenter/view/login/widgets_login/button_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerLogin = GetIt.I.get<IAuthUser>();

  final Widget _gradient = Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFEA5E5E),
          Color(0xFFEAA15E),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _gradient,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'faça login para \n ter acesso aos produtos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                ButtonLoginWidget(
                  imageSouce: 'assets/images/search.png',
                  typeLogin: 'Google',
                  color: Colors.white,
                  login: () {
                    controllerLogin.signIn();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
