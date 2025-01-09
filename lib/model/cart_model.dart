import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "2.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "1.00", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "4.00", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
  ];

  List _cartItems = [];

  get cartItems => _cartItems;
  get shopItems => _shopItems;

  void addToCart(BuildContext context, index) {
    _cartItems.add(_shopItems[index]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Item added to cart",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
        content: const Text("Item has been added to your cart successfully.",
            style: TextStyle(fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text("OK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );

    notifyListeners();
  }

  void removeFromCart(index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
