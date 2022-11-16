// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  ButtonLoginWidget({
    Key? key,
    required this.imageSouce,
    required this.typeLogin,
    required this.login,
    required this.color,
  }) : super(key: key);

  String imageSouce;
  String typeLogin;
  VoidCallback login;
  Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: login,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imageSouce,
            width: 25,
            fit: BoxFit.cover,
          ),
          Text(
            'Login com $typeLogin',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(10),
        onPrimary: Colors.red,
      ),
    );
  }
}
