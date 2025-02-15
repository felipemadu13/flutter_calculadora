import 'package:flutter/material.dart';
import 'package:flutter_calculadora/home_screen.dart';
import 'package:flutter_calculadora/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      home: const HomeScreen(),
    ),
  );
}
