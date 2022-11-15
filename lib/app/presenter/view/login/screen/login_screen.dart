import 'package:desafio_apirest/app/domain/constants/routes_app.dart';
import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_controller.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_state.dart';
import 'package:desafio_apirest/app/presenter/view/login/widgets_login/button_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerLogin = GetIt.I.get<LoginController>();

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
  void initState() {
    super.initState();

    controllerLogin.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LoginController, LoginState>(
          bloc: controllerLogin,
          listener: (context, state) {
            if (state is LoginSucesso) {
              Navigator.pushNamed(context, RoutesApp.homeRouter);
              return;
            }
          },
          builder: (context, state) {
            if (state is LoginCarregando) {
              return Center(
                child: CircularProgressWidget(
                  color: Colors.red,
                ),
              );
            }

            if (state is LoginError) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is LoginFalhou) {
              return Stack(
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
                            controllerLogin.loginUser();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
