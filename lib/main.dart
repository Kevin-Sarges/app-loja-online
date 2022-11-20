import 'package:desafio_apirest/app/app_widget.dart';
import 'package:desafio_apirest/app/domain/inject/inject_dependency.dart';
import 'package:desafio_apirest/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InjectDependency.init();

  runApp(const MyApp());
}
