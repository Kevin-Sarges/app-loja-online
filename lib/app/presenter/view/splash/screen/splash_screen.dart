import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/domain/constants/routes_app.dart';
import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      checkSignedIn(context);
    });

    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     checkSignedIn(context);
    //   },
    // );
  }

  void checkSignedIn(BuildContext ctx) async {
    final user = await controllerLogin.isLoggerIn();

    if (user != null) {
      Navigator.pushNamed(context, RoutesApp.homeRouter);
    } else {
      Navigator.pushNamed(context, RoutesApp.loginRouter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _gradient,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sacolas-de-compras.png',
                height: 240,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              CircularProgressWidget(
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
