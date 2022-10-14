import 'package:desafio_apirest/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  await getDatabasesPath();
  runApp(const MyApp());
}
