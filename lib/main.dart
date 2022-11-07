import 'package:desafio_apirest/app/app_widget.dart';
import 'package:desafio_apirest/app/data/inject/sqflite_inject.dart';
import 'package:flutter/material.dart';

void main() async {
  SqfliteInject.init();
  runApp(const MyApp());
}
