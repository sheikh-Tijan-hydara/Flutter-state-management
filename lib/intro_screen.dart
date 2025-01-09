import 'package:flutter/material.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 160),
          child: Image.asset('lib/images/chicken.png'),
        ),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'We deliver fresh groceries to your doorstep',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Fresh items every day",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600], fontSize: 20),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 20),
              child: const Text("Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )),
        const Spacer(),
      ],
    ));
  }
}
