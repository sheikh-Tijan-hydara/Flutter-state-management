import 'package:flutter/material.dart';
import 'package:shopping_cart/intro_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroScreen(),
        ));
  }
}
