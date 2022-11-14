import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder(
        builder: (context, state) {
          if (state is LoginLoading) {
            return CircularProgressWidget(
              color: Colors.white,
            );
          }

          if (state is LoginError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Container();
        },
      ),
    );
  }
}
