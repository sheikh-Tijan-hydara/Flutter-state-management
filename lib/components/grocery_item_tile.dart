import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final color;
  void Function()? onPressed;
  GroceryItemTile(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: color[100], borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 80,
              ),
              Text(name),
              MaterialButton(
                onPressed: onPressed,
                color: color[800],
                child: Text(
                  '\$$price',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
